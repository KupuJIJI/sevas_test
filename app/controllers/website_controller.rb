class WebsiteController < ApplicationController
  def index
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
  end

  def invite
    @code =  Code.new
    puts params[:code]
    if params[:code] && Code.create(email: params[:code][:email])
      CodeMailer.invite_email(params[:code][:email], view_context.link_to( registration, website_registration_url(@code.id))).deliver
    end
  end


  private
  def admin_user_params
    params.require(:admin_user).permit(:email, :password, :password_confirmation)
  end  
end
