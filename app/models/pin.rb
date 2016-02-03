class Pin < ActiveRecord::Base
	 acts_as_taggable_on :tags

     belongs_to :admin
     has_attached_file :image, :styles => { :medium => "700x700>", :thumb => "100x100>" }

     validates :image, presence: true
  	 validates :description, presence: true

  	 validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
