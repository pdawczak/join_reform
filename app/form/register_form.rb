class RegisterForm < Reform::Form
  extend ActiveModel::ModelValidations

  property :email
  property :password
  property :password_confirmation

  copy_validations_from User

  validates :password, presence: true

  validate :passwords_match

  private

  def passwords_match
    errors.add(:password_confirmation, "passwords don't match") unless password == password_confirmation
  end
end
