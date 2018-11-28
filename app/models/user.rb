class User < ApplicationRecord
	devise :database_authenticatable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable
	 
	has_many :books, dependent: :destroy
	attachment :image

	validates :name, presence: true, length: { in: 2..20 }
	validates :introduction, length: { maximum: 50 }

end
