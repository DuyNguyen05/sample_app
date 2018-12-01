module StaticPagesHelper
  def full_title(page_title = '')
    app_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      app_title
    else
      page_title + " | " + app_title
    end
  end
end
