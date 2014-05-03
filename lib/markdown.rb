class Markdown
  attr_reader :options

  def initialize(options = {})
    @options = default_options.merge(options)
  end

  def render(text)
    Kramdown::Document.new(text, options).to_html
  end

  def default_options
    {
        coderay_line_numbers: nil
    }
  end
end