class EditUserForm < Reform::Form
  extend ActiveModel::ModelValidations

  property :email

  copy_validations_from User
end
