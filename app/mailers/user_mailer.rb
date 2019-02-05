class UserMailer < ApplicationMailer
  default from: "contact@followarmy.com"

  def contact_form(email, name, message)
    # format date
    @date = DateTime.now.to_formatted_s(:short)

    @message = message
    @name = name
    @email = email
    mail(from: "contact@followarmy.com", to: "contact@followarmy.com", subject: "New message from: #{@name}")
  end

end
