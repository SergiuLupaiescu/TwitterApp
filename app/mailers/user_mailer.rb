# frozen_string_literal: true

class UserMailer < ApplicationMailer

  def confirmation_email(user)
    @user = user
    receiver = user.email
    subject = "Confirm your registration on Twitter"

    # TODO: update the logic on this part
    # https://berislavbabic.com/send-pdf-attachments-from-rails-with-wickedpdf-and-actionmailer/
    # https://mailtrap.io/blog/ruby-send-email/

    mail(
      to: receiver,
      subject: subject
    )
  end
end
