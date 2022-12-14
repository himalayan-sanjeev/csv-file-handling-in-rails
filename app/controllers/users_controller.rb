class UsersController < ApplicationController
  # require 'csv'
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.csv { send_data User.to_csv, filename: "Users-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"}
    end
  end

  def export_into_csv
    file = "#{Rails.root}/public/user_data-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"
    users = User.order(:first_name)
    headers = ["S.N.","first_name","last_name","address_city","address_state","mobile_number","email", "date_of_birth"]

    CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
      users.each do |user|
        writer << [user.id, user.first_name, user.last_name, user.address_city, user.address_state, user.mobile_number, user.email, user.date_of_birth]
      end
    end
    redirect_to root_path
  end

   
  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import_users
    User.import(params[:file])
    redirect_to root_path, message: "Data imported!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :address_city, :address_state, :mobile_number, :email, :date_of_birth)
    end
end
