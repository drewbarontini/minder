# ====================================
#   Custom Helpers
# ====================================

module CustomHelpers

  # Get total number of pages
  #
  # == Usage
  #
  #   total = get_total_pages
  #
  def get_total_pages
    data.pages.count
  end

  # Get the page count of status
  #
  # == Parameters
  #
  # @param status [String] the status of the string
  #
  # == Usage
  #
  #   get_page_count('success')
  #
  def get_page_count(status)
    data.pages.select { |page| page.status == status }.count
  end

  # Get the section page count
  #
  # == Parameters
  #
  # @param section [String] the section
  # @param status [String] the status (optional)
  #
  # == Usage
  #
  #   get_section_page_count('section-one')
  #   get_section_page_count('section-one', 'success')
  #
  def get_section_page_count(section, status = nil)
    unless status
      data.pages.select { |page| page.type == section }.count
    else
      data.pages.select { |page| page.type == section and page.status == status }.count
    end
  end

  # Get the build progress percentage
  #
  # == Usage
  #
  #   get_build_progress
  #
  def get_build_progress
    total    = get_total_pages
    complete = get_page_count('success')
    progress = (complete.to_f / total.to_f) * 100

    progress.ceil
  end

  # Check if the section is complete
  #
  # == Parameters
  #
  # @param type [String] the section type
  #
  # == Usage
  #
  #   is_section_complete('section-one')
  #
  def is_section_complete(type)
    total    = data.pages.select { |p| p.type == type }.count
    complete = data.pages.select { |p| p.type == type && p.status == 'success' }.count

    total == complete ? true : false
  end

  # Check if the page is active
  #
  # == Parameters
  #
  # @param page [String] the page to check
  #
  # == Usage
  #
  #   %li{ is_page_active(section_url) }
  #
  def is_page_active(page)
    current_page.url == page ? { class: 'is-active' } : {}
  end

  # Turns a string into a slugable string
  #
  # == Parameters
  #
  # @param string [String] the string to convert
  #
  # == Usage
  #
  #   slugify('This is my string')
  #
  def slugify(string)
    string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end
