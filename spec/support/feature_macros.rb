module FeatureMacros
  def sign_in_as_user
    @user = create(:user)

    login_as(@user, scope: :user)
  end

  def sign_in_as_admin
    @admin = create(:admin_user)

    login_as(@admin, scope: :admin_user)
  end
end
