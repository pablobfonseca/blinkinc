class NavPresenter
  def initialize(account, view_context)
    @account      = account
    @view_context = view_context
  end

  def render_nav
    return user_nav if user?
    admin_nav
  end

  private
  attr_reader :account, :view_context

  def user?
    account.is_a?(User)
  end

  def user_nav
    view_context.render("layouts/user_nav")
  end

  def admin_nav
    view_context.render("layouts/admin_nav")
  end
end
