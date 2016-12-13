class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {maximum: 200}
  belongs_to :user
end
