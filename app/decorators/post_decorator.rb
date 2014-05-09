class PostDecorator < Draper::Decorator
  delegate_all

  def render_body
    Markdown.new.render(object.body).html_safe
  end

  def render_created_at
    h.content_tag :span, object.created_at, class: 'time zone unprocessed', data: { utc: object.created_at.to_i }
  end
  def render_updated_at
    h.content_tag :span, object.updated_at, class: 'time zone unprocessed', data: { utc: object.updated_at.to_i }
  end
end