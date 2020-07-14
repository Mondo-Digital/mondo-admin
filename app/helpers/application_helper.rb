module ApplicationHelper
  def active_link_to(name = nil, options = {}, html_options = {}, &block)
    current_path_match(options)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_path_match(options)
    link_to(name, options, html_options, &block)
  end

  private

  def current_path_match(options)
    current_page?(options) || request.path.start_with?(options)
  end
end
