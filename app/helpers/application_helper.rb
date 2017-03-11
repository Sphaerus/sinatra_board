module ApplicationHelper
  def set_title(value = nil)
    @title = value
    @title ? "Controller Demo - #{@title}" : "Controller Demo"
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def base_url
    @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
  end

  def link_to(name, path, method: nil)
    "<a href='#{path}' method='#{method}'>#{name}</a>"
  end
end
