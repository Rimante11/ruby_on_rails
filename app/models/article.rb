#Article - name of the model, ApplicationRecord - subclass
class Article < ApplicationRecord
  belongs_to :user #article can belong to one user
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: { minimum: 6, maximum: 100}
  validates :description, presence: true, length: { minimum: 10, maximum: 100}
end
