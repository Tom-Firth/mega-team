class Article < ApplicationRecord
  belongs_to :user

  validates :title, length: { maximum: 16 }
end
