class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_action :set_cache_buster, :set_default_page

  # desc: set the page cache
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

=begin
  desc: method to set the javascripts and css for a page
  @return:[object]
=end
  def set_default_page
    #define the array for the javascripts and stylesheets
    styles_arr = ['application']
    js_arr = []
    #create the new instance of the page object
    @page ||= ::Page.new(
        :title => 'College Dual',
        :stylesheets => styles_arr,
        :javascripts => js_arr
    )
    if devise_controller?
      @page.stylesheets.push.push('sign-in') if (controller_name == 'sessions' and action_name == 'new') or (controller_name == 'registrations' and action_name == 'new')
    end
  end
end

