class Group < ActiveRecord::Base
  belongs_to :user
  has_many :memberships
  has_many :user_memberships, through: :memberships, source: :user

  validates :group_name, :group_description, :presence => true
  validates :group_name, length: { minimum: 5 }
  validates :group_name, length: { minimum: 10 }
end
