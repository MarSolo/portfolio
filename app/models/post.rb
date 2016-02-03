class Post < ActiveRecord::Base
	
	belongs_to :admin

	validates :title, presence: true,
                    length: { minimum: 5 }

    validates :text, presence: true

    has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100>" }

    validates :image, presence: true

    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


end