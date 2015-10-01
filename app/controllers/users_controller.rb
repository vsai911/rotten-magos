class UsersController < ApplicationController
  def new
     @user = User.new
    end

  def create
    # password = user_params[:password]
    # my_password = BCrypt::Password.create(password)

    @user = User.new( 
        email: user_params[:email],
        firstname: user_params[:firstname],
        lastname: user_params[:lastname],
        password: user_params[:password],
        password_confirmation: user_params[:password_confirmation]
        )
    # crazy password string
    if @user.save
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
    else
      render :new
    end
  end


  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

end

