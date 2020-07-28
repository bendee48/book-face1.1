class UserMailer < ApplicationMailer
  default from: 'notifications@bookface.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to BookFace")
  end
end
