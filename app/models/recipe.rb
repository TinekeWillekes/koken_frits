class Recipe < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, length: { maximum: 30 }, presence: true
  validates :number_of_persons, presence: true, numericality: true
  validates :cooking_time, presence: true, numericality: true
  validates :directions, presence: true

end
