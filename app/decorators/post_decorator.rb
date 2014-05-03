class PostDecorator < Draper::Decorator
  delegate_all

  def render_body
    Markdown.new.render(object.body).html_safe
  end
end