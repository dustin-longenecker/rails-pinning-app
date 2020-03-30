class Pin < ActiveRecord::Base
  #before_save : 
  validates_presence_of :title, :url, :slug, :text, :category
  validates_uniqueness_of :slug
  belongs_to :category
end