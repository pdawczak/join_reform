class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true

  validates :password, presence: true              if: :test
  validates :password_confirmation, presence: true if: Proc.new { |u| ??? }
end
