class PasswordResetsController < ApplicationController

  # GET /password_resets/new
  def new
  end

  # POST /password_resets == password_resets_path
  # params[:password_reset][:email <== User Input

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  # GET /password_resets/:id/edit
  def edit
    # パスワードを入力してもらうフォームを描画
  end

  # PATCH /password/:id
  def update
    # パスワードを再設定する
  end
end
