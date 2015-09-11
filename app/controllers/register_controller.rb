class RegisterController < ApplicationController
  def new
    @form = RegisterForm.new(User.new)
  end

  def create
    @form = RegisterForm.new(User.new)

    if @form.validate(params[:user])
      @form.save
      redirect_to @form.model, notice: "Welcome #{@form.model.email}. You have been registered successfully!"
    else
      render :new
    end
  end
end
