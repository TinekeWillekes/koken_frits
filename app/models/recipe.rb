class Recipe < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, length: { minimum: 20 }, presence: true

end
