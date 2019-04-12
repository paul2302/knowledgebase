class Article < ApplicationRecord
  validates :question, presence: true,
            length: {minimum: 5}
end
