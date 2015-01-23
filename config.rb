# ====================================
#   Activate Plugins
# ====================================

activate :automatic_image_sizes
activate :directory_indexes
activate :livereload
activate :minify_html

# ====================================
#   Global Variables
# ====================================

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

set :relative_links, true

set :index_section, data.config.index_section
set :status_path, data.config.path

# ====================================
#   Ignore Files & Directories
# ====================================

ignore "#{ status_path }template.haml"
ignore "#{ status_path }type.haml"

# ====================================
#   Helpers
# ====================================

helpers do
  def get_sections
    data.pages.map { |page| page.type }.uniq
  end

  def get_status_types
    data.pages.map { |page| page.status }.uniq
  end
end

# ====================================
#   Template Files
# ====================================

get_sections.each do |page|
  if page == index_section
    proxy "#{status_path}index.html", "#{status_path}template.html", locals: { :page_name => page }
  else
    proxy "#{status_path}#{page}.html", "#{status_path}template.html", locals: { :page_name => page }
  end
end

get_status_types.each do |status|
  proxy "#{status_path}#{status}.html", "#{status_path}type.html", locals: { :status => status }
end

# ====================================
#   Build Configuration
# ====================================

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end
