class Pin < ActiveRecord::Base
  before_save :title, :url, :slug, :image, :category
  validates_presence_of :title, :url, :slug, :text, :category
  validates_uniqueness_of :slug
  has_attached_file :image, styles: { medium: "300x300>", thumb: "60x60>" }, default_url: "http://placebear.com/300/300"  
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  belongs_to :category
end