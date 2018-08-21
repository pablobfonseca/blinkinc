module FeatureMacros
  def sign_in_as_user
    @user = create(:user)

    login_as(@user, scope: :user)
  end
end
