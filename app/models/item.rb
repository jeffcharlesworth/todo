class Item < ActiveRecord::Base
  belongs_to :list

  validates :name, presence: true
  validates :description, length: { minimum: 2, maximum: 1000 }
end
