class User < ActiveRecord::Base
  include Security

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :rememberable, :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  has_many :posts
end
