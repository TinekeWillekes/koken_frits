class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  
  has_many :quantities
  has_many :ingredients, 
           :through => :quantities
 
  accepts_nested_attributes_for :quantities, 
           :reject_if => :all_blank, 
           :allow_destroy => true
  accepts_nested_attributes_for :ingredients
  
  validates :user_id, presence: true
  validates :title, length: { maximum: 30 }, presence: true
  validates :number_of_persons, presence: true, numericality: true
  validates :cooking_time, presence: true, numericality: true
  validates :directions, presence: true
  
  has_attached_file :recipe_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/recipe_images/missing.png"
  validates_attachment_content_type :recipe_image, :content_type => /\Aimage\/.*\Z/

  self.per_page = 5
 
  private
  
  def self.search(query)
    where("title like ?", "%#{query}%") 
  end
end
