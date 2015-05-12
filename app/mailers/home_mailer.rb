class HomeMailer < ApplicationMailer

  def contact_email(params)
    @message = params[:message]
    @subject = params[:subject]

    mail to: "Wesley Reid <bwreid@gmail.com>",
         from: "#{params[:name]} <#{params[:email]}>",
         subject: "FREELANCE: Email from your contact form"
  end
end
