class Recipe < ActiveRecord::Base
  validates_presence_of :title, :ingredients, :instructions
  belongs_to :category
end
