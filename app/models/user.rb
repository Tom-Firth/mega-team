class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable < J'ai retiré
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_many :articles
end
