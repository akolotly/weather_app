module ApplicationHelper
  def default_title(page_title)
    base_title = 'Weather App'
    return base_title if page_title.empty?
    " #{base_title} | #{page_title} "
  end
end
