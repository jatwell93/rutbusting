class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :conversations, :foreign_key => :sender_id
  has_many :reviews, dependent: :destroy
  has_many :tasks, dependent: :destroy
  validates :first_name, :last_name, presence: true
end
