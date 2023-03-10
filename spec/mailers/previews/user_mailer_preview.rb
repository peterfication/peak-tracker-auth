##
# Start the rails server and visit http://localhost:3000/rails/mailers to preview all emails.
#
# Preview all UserMailer emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/reset_password_instructions
  def reset_password_instructions
    UserMailer.reset_password_instructions(User.new(email: "mail@example.com"), "fake-token")
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/confirmation_instructions
  def confirmation_instructions
    UserMailer.confirmation_instructions(User.new(email: "mail@example.com"), "fake-token")
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/unlock_instructions
  def unlock_instructions
    UserMailer.unlock_instructions(User.new(email: "mail@example.com"), "fake-token")
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/email_changed
  def email_changed
    UserMailer.email_changed(User.new(email: "new@example.com"))
  end
end
