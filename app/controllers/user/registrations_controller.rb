class User::RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    @email = AssociatePartner.find_by_email(@user.email)
    @email.update_attribute(:status, "No")
    RequirementMailer.sent_user(@user).deliver
    redirect_to dealers_admin_dashboards_path
  end
  
  def update_status
    @user = User.find_by_email(params[:email])
    @user.approved == true ? (@user.update_attribute(:approved, false)) : (@user.update_attribute(:approved, true))
    redirect_to dealers_admin_dashboards_path
  end

  private 
  def user_params
    params.require(:user).permit!
  end
end