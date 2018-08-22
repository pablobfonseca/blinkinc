module Admin
  class UsersController < BaseController
    before_action :find_user, only: [:edit, :update]

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to admin_users_path
      else
        render :new
      end
    end

    def edit
      @user = User.find params[:id]
    end

    def update
      @user = User.find params[:id]

      if @user.update(user_params)
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    private

    def find_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end
end
