module ApplicationHelper
  def current_account
    current_user || current_admin_user
  end

  def present(model, presenter_class=nil)
    klass = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)
    block_given?? yield(presenter) : presenter
  end
end
