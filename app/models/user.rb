class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates :username, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  attachment :image
  has_many :posts

	validates :name, presence: true
	validates :name,    length: { in: 2..20 }
	validates :introduction,   length: { maximum: 50 }

end
