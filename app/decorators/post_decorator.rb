class PostDecorator < Draper::Decorator
  delegate_all

  def render_body
    Markdown.new.render(object.body).html_safe
  end

  def render_title(*scope)
    h.link_to title, [*scope, object]
  end

  def render_created_at
    h.content_tag :span, object.created_at, class: 'time zone unprocessed', data: { utc: object.created_at.to_i }
  end

  def render_updated_at
    h.content_tag :span, object.updated_at, class: 'time zone unprocessed', data: { utc: object.updated_at.to_i }
  end

  def render_tag_list
    h.capture do
      object.tags.each do |tag|
        h.concat(h.content_tag(:span, class: 'label label-tags') {
          h.link_to(tag.name, h.polymorphic_path([:posts], tag: tag.name))
        })
      end
    end
  end

  def render_edit_button
    h.link_to(h.content_tag(:i, '', class: 'glyphicon glyphicon-pencil'), h.polymorphic_path([:edit, :admin, object]), class:'btn btn-success btn-xs')
  end
end