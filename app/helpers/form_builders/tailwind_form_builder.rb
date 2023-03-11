##
# Adapted from
# - https://blog.testdouble.com/posts/2022-12-05-blending-tailwind-with-rails-forms/
# - https://github.com/Daniel-N-Huss/tailwind_form_builder_example/blob/main/app/lib/form_builders/tailwind_form_builder.rb
module FormBuilders
  ##
  # A form builder that uses Tailwind CSS classes
  class TailwindFormBuilder < ActionView::Helpers::FormBuilder
    TEXT_FIELD_HELPERS = %i[
      color_field
      date_field
      datetime_field
      datetime_local_field
      email_field
      month_field
      number_field
      password_field
      phone_field
      range_field
      search_field
      telephone_field
      text_area
      text_field
      time_field
      url_field
      week_field
    ].freeze

    TEXT_FIELD_STYLE = %w[
      w-full
      bg-gray-200
      rounded
      py-2
      px-4
      text-gray-700
      leading-tight
      focus:outline-none
      focus:bg-white
      focus:border-sky-500
    ].join(" ").freeze

    SELECT_FIELD_STYLE = %w[
      w-full
      block
      bg-gray-200
      text-gray-700
      py-2
      px-4
      rounded
      leading-tight
      focus:outline-none
      focus:bg-white
      focus:border-sky-500
    ].join(" ").freeze

    SUBMIT_BUTTON_STYLE = %w[
      cursor-pointer
      border-0
      w-full
      shadow
      bg-sky-600
      focus:shadow-outline
      focus:outline-none
      text-white
      font-bold
      py-2
      px-4
      rounded
      hover:bg-sky-400
      active:translate-y-1
    ].join(" ").freeze

    ##
    # Define all text field helpers that we want to style.
    #
    # This method calls the text_like_field method, which will apply the styles
    # and call this method again to then call the parent form build class.
    TEXT_FIELD_HELPERS.each do |field_method|
      define_method(field_method) do |method, options = {}|
        return super(method, options.except(:tailwindified)) if options[:tailwindified]

        text_like_field(field_method, method, options)
      end
    end

    def submit(value = nil, options = {})
      custom_opts, opts = partition_custom_opts(options)
      classes = apply_style_classes(SUBMIT_BUTTON_STYLE, custom_opts)

      super(value, { class: classes }.merge(opts))
    end

    def select(method, choices = nil, options = {}, html_options = {}, &)
      custom_opts, opts = partition_custom_opts(options)
      classes = apply_style_classes(SELECT_FIELD_STYLE, custom_opts, method)

      labels = labels(method, custom_opts[:label], options)
      field = super(method, choices, opts, html_options.merge({ class: classes }), &)

      labels + field
    end

    private

    def text_like_field(field_method, object_method, options = {}) # rubocop:disable Metrics/MethodLength
      custom_opts, opts = partition_custom_opts(options)

      classes = apply_style_classes(TEXT_FIELD_STYLE, custom_opts, object_method)

      field =
        send(
          field_method,
          object_method,
          { class: classes, title: errors_for(object_method)&.join(" ") }.compact
            .merge(opts)
            .merge({ tailwindified: true }),
        )

      labels = labels(object_method, custom_opts[:label], options)

      labels + field
    end

    def labels(object_method, label_options, field_options)
      label = tailwind_label(object_method, label_options, field_options)
      error_label = error_label(object_method, field_options)

      @template.content_tag("div", label + error_label, { class: "flex flex-col items-start" })
    end

    def tailwind_label(object_method, label_options, field_options)
      text, label_opts =
        (label_options.present? ? [label_options[:text], label_options.except(:text)] : [nil, {}])

      label_classes =
        label_opts[:class] || "block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4"
      label_classes += " text-yellow-800 dark:text-yellow-400" if field_options[:disabled]
      label(object_method, text, { class: label_classes }.merge(label_opts.except(:class)))
    end

    def error_label(object_method, options)
      return if errors_for(object_method).blank?

      error_message = @object.errors[object_method].collect(&:titleize).join(", ")
      tailwind_label(
        object_method,
        { text: error_message, class: " font-bold text-red-500" },
        options,
      )
    end

    def border_color_classes(object_method)
      if errors_for(object_method).present?
        " border-2 border-red-400 focus:border-rose-200"
      else
        " border border-gray-300 focus:border-yellow-700"
      end
    end

    def apply_style_classes(classes, custom_opts, object_method = nil)
      classes + border_color_classes(object_method) + " #{custom_opts[:class]}"
    end

    CUSTOM_OPTS = %i[label class].freeze
    def partition_custom_opts(opts)
      opts.partition { |k, _v| CUSTOM_OPTS.include?(k) }.map(&:to_h)
    end

    def errors_for(object_method)
      return unless @object.present? && object_method.present?

      @object.errors[object_method]
    end
  end
end
