class UsersController < ApplicationController
  # before_action は上から順に実行される
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

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
      flash[:success] = "Profile updated"
      redirect_to @user
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

    def logged_in_user
      if not logged_in?
        # GET   /users/:id/edit
        # PATCH /users/:id
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      # GET   /users/:id/edit
      # PATCH /users/:id
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
