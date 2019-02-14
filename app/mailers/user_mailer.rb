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

  def register_info(user)

    @name = user.username
    @date = DateTime.now.to_formatted_s(:short)
    @email = user.email
    @subject = "WebShop - Registration email"

    @message = "
      <p>
        Welcome to my WebShop #{user.username}.<br>
        You can now log in <a href='http://localhost:3000/login'>here</a>.
      </p>
    ".html_safe

    mail(to: user.email, subject: @subject)

  end

end
