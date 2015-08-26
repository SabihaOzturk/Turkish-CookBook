class Recipe < ActiveRecord::Base

  belongs_to :category
  has_many :comments

  validates :image, presence: true
  validates :title, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true

  
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", small: "150x150>"}, 
                    :url => "/assets/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/:id/:style/:basename.:extension"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  def self.search(search)
    if search
      #Recipe.find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
      Recipe.where('title LIKE ?', "%#{search}%")
    else
      Recipe.all
    end
  end

end
