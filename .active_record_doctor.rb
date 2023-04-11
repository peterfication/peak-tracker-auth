ActiveRecordDoctor.configure do
  global(
    :ignore_tables,
    [
      # Ignore Rails internal tables
      "ar_internal_metadata",
      "schema_migrations",
    ],
  )

  detector(
    :undefined_table_references,
    ignore_models: [
      # Ignore internal Rails-related models that we don't use yet
      "ActionMailbox::InboundEmail",
      "ActionText::EncryptedRichText",
      "ActionText::RichText",
      "ActiveStorage::Attachment",
      "ActiveStorage::Blob",
      "ActiveStorage::VariantRecord",
    ],
  )

  detector(
    :missing_presence_validation,
    ignore_models: %w[Doorkeeper::AccessGrant Doorkeeper::AccessToken Doorkeeper::Application],
  )

  detector(:missing_unique_indexes, ignore_models: %w[Doorkeeper::OpenidConnect::Request])
end
