class Post < ActiveRecord::Base
  extend Enumerize
  validates :title, presence: true
  validates :body, presence: true

  enumerize :status, in: { draft: 1, published: 2, deleted: 3 }, default: :draft, scope: true

  scope :published, -> { with_status(:published) }
  scope :current, -> { without_status(:deleted) }

  def to_param
    [id, title.parameterize].join('-')
  end
end