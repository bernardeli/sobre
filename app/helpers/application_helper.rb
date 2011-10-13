module ApplicationHelper
  def selected_class(path)
    current_page?(path) ? "selected" : ""
  end
end
