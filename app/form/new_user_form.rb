class NewUserForm < Reform::Form
  extend ActiveModel::ModelValidations

  property :email
  property :password

  copy_validations_from User

  validates :password, presence: true
end
