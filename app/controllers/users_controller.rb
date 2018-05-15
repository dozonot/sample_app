class UsersController < ApplicationController

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    # => app/views/users/show.html.erb
    # debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Sucess
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_url(@user)
    else
      # Failure
      render 'new'
    end
  end

  # GET /users/:id
  def edit
    @user = User.find(params[:id])
  end
  # => app/views/users/edit.html.erb

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Success
    else
      # Failure
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit( :name, :email, :password,
                                  :password_confirmation)
  end
end
