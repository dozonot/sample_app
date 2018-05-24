class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
    # => https://hogehoge.com/account_activations/:id/edit
    # :id <= @user.activation_token

  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
