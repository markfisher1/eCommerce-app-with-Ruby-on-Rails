class SimplePagesController < ApplicationController
  def index
  end

  def thank_you

    @name = params[:mame]
    @email = params[:email]
    @message = params[:message]

    # send email
    UserMailer.contact_form(@email, @name, @message).deliver_now

  end

end
