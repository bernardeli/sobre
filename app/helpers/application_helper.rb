module ApplicationHelper
  def selected_class(path)
    current_page?(path) ? "selected" : ""
  end

  def theme_class
    current_page?(dashboard_index_path) ? current_user.theme : @user.theme
  end
end
