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
    @user = User.new(params[:user])

    if @user.save
      # Sucess
    else
      # Failure
      rendre 'new'
    end
  end
end
