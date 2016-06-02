class User < ActiveRecord::Base

  has_secure_password

  validates :email,
  presence: true

  validates :full_name,
  presence: true

  validates :username,
  presence: true

  validates :password,
  length: { in: 6..20 }, on: :create

end
