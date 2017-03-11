class ApplicationController < MyApp
  helpers ApplicationHelper
  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  # don't enable logging when running tests
  configure :production, :development do
    enable :logging
  end

  get '/' do
    render_with_template :root
  end

  # will be used to display 404 error pages
  not_found do
    set_title 'Not Found!'
    render_with_template :not_found
  end

  private

  def render_with_template(sym)
    set_title title
    haml sym.to_sym, layout: :layout
  end

  def title
    'Welcome'
  end

  def authenticate_user
    if current_user
      return true
    end
    redirect to(base_url + '/users/sign_in')
  end
end
