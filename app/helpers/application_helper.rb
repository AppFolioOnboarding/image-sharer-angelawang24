module ApplicationHelper
  def determine_active(action)
    'active' if action != params[:action]
  end
end
