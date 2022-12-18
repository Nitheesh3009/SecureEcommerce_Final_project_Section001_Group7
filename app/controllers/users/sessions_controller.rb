class Users::SessionsController < Devise::SessionsController


  def create
    @user = User.find_by(email: users_params[:email])


    if @user.nil?
      redirect_to new_user_session_path, alert: "Invalid email or password."
    elsif @user.valid_password?(users_params[:password])
      @user.generate_and_send_otp
      redirect_to enter_otp_path(@user), notice: "Please verify your otp"
    else
      redirect_to new_user_session_path, alert: "Invalid email or password."
    end
  end

  def enter_otp
    @user = User.find(params[:id])
  end

  def resend_otp
    @user = User.find(params[:id])
    @user.generate_and_send_otp
    redirect_to enter_otp_path(@user), notice: "Please verify your otp"
  end

  def verify_otp
    @user = User.find(params[:id])

    if @user.otp == params[:user][:otp]
      sign_in @user
      redirect_to root_path, notice: "Signed in successfully."
    else
      redirect_to enter_otp_path(@user), alert: "Invalid otp"
    end
  end

  private

  def users_params
    params.require(:user).permit(:email, :password)
  end
end