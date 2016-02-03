class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy

  has_many :pins, dependent: :destroy

  validates :name, presence: true

  validates_format_of :email, :with => /gmail\.com/, 
  :message => "- That's not a valid email address."
end
