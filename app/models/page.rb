=begin
desc: This is the custom class. It is meant for handling the javascripts and css in the application
we can customize it in fancy way, so that it can handle more features in the application
=end
class Page
  attr_accessor :title, :javascripts, :stylesheets, :active_link, :sub_active_link

=begin
  desc: It is the constructor for the Page class  we are initiating the attribute of the class
  @param: hash
=end
  def initialize(options)
    @title = options[:title] ||= nil
    @javascripts = options[:javascripts] ||= nil
    @stylesheets = options[:stylesheets] ||= nil
    @active_link = options[:active_link] ||= nil
    @sub_active_link = options[:sub_active_link] ||= nil
  end

end