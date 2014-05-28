activate :automatic_image_sizes
activate :directory_indexes
activate :livereload
activate :minify_html

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

set :relative_links, true

set :index_section, data.config.index_section
set :status_path, data.config.path

ignore "#{status_path}template.haml"
ignore "#{status_path}type.haml"

helpers do
  def is_page_active(page)
    current_page.url == page ? { class: 'is-active' } : {}
  end

  def get_total_pages
    data.pages.count
  end

  def get_sections
    sections = []
    data.pages.each do |p|
      sections << p.type
    end
    sections.uniq
  end

  def get_status_types
    types = []
    data.pages.each do |p|
      types << p.status
    end
    types.uniq
  end

  def get_page_count(status)
    pages = []
    data.pages.each do |p|
      pages << p if p.status == status
    end
    pages.count
  end

  def get_section_page_count(section, status = nil)
    pages = []
    data.pages.each do |p|
      unless status
        pages << p if p.type == section
      else
        pages << p if p.type == section and p.status == status
      end
    end
    pages.count
  end

  def get_build_progress
    total =  get_total_pages()
    complete = get_page_count('success')
    progress = (complete.to_f / total.to_f) * 100
    progress.ceil
  end

  def is_section_complete(type)
    complete = []
    total = []
    total += data.pages.select { |p| p.type == type }
    complete += data.pages.select { |p| p.type == type && p.status == 'success' }
    total.count == complete.count ? true : false
  end

  def slugify(string)
    string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end

get_sections().each do |page|
  if page == index_section
    proxy "#{status_path}index.html", "#{status_path}template.html", locals: { :page_name => page }
  else
    proxy "#{status_path}#{page}.html", "#{status_path}template.html", locals: { :page_name => page }
  end
end

get_status_types().each do |status|
  proxy "#{status_path}#{status}.html", "#{status_path}type.html", locals: { :status => status }
end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end
