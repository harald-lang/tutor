class StatusMailer < ActionMailer::Base
  default from: Rails.application.secrets.email_sender_full

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.status_mailer.new.subject
  #
  def new(student)
  	@student=student
    mail to: student.email, subject: "GDB Student Token Email"
  end
end
