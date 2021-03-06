class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @form = NewUserForm.new(@user)
  end

  # GET /users/1/edit
  def edit
    @form = EditUserForm.new(@user)
  end

  # POST /users
  # POST /users.json
  def create
    @form = NewUserForm.new(User.new)

    respond_to do |format|
      if @form.validate(params[:user])
        @form.save
        format.html { redirect_to @form.model, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @form.model }
      else
        format.html { render :new }
        format.json { render json: @form.model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @form = EditUserForm.new(@user)

    respond_to do |format|
      if @form.validate(params[:user])
        @form.save
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
