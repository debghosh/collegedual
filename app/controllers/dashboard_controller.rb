class DashboardController < ApplicationController

  before_action :set_page
  layout 'home'

  def index

  end

  def set_page
    @page.stylesheets.push.push('dashboard')
    @page.javascripts.push('dashboard', 'index-slider')
  end
end
