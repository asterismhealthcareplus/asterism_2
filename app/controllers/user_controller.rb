class UserController < ApplicationController
  load_and_authorize_resource
   
  def index
    @users = User.excludes(:id => current_user.id)
  end
   
  def new
    @user = User.new
  end	   
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
   
  def edit
    @user = User.find(params[:id])
  end
   
  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(update_params)
      flash[:notice] = "Successfully updated User."
      redirect_to all_users_path
    else
      render :action => 'edit'
    end
  end
   
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end

  private
   
  def update_params #permitted parameters for update action. This is required for rails 4's Strong Parameter feature 
    params.require(:user).permit(:company, :email, :first_name, :last_name, :office_location, :office_city, :office_country, :employee, :customer, :admin) 
  end
end

