class WebsiteController < ApplicationController

  def index
    @error = 'Set up phone in your profile' if current_admin_user.phone == ''
    
  end

  def registration
    @code = Code.where(id: params[:format])
    @access = @code.exists? if params[:format]
    if params[:admin_user] 
      AdminUser.create(admin_user_params)
      Code.where(id: params[:admin_user][:code_id]).destroy
    else
      @user = AdminUser.new
    end
  end

  def profile
    @error = 'Set up phone in your profile' if current_admin_user.phone == ''
    if params[:admin_user]
      puts @user = AdminUser.find(params[:admin_user][:id])
      @user.update_attributes(admin_user_params)
      redirect_to root_path
    else
      @user = current_admin_user
    end
  end

  def invite
    @access = false unless  current_admin_user.role == 1
    @code =  Code.new
    puts params[:code]
    if params[:code] && Code.create(email: params[:code][:email])
      CodeMailer.invite_email(params[:code][:email], view_context.link_to( registration, website_registration_url(@code.id))).deliver
    end
  end


  private
  def admin_user_params
    params.require(:admin_user).permit(:email, :password, :password_confirmation, :phone)
  end  
end
