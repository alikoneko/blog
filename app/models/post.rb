class Post < ActiveRecord::Base
  extend Enumerize
  validates :title, presence: true
  validates :body, presence: true

  acts_as_taggable

  enumerize :status, in: { draft: 1, published: 2, deleted: 3 }, default: :draft, scope: true

  default_scope { order 'created_at DESC' }
  scope :published, -> { with_status(:published) }
  scope :current, -> { without_status(:deleted) }

  def to_param
    [id, title.parameterize].join('-')
  end
end