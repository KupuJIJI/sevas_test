class WebsiteController < ApplicationController
  def index
  end

  def registration
  end

  def invite
    @code =  Code.new
    puts params[:code]
    if params[:code] && Code.create(email: params[:code][:email])
      CodeMailer.invite_email(params[:code][:email], view_context.link_to( registration, website_registration_url(@code.id))).deliver
    end
  end
end
