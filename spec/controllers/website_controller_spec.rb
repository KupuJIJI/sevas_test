require 'spec_helper'

describe WebsiteController do
  describe "POST registration" do
    it "test params" do
      puts 'WHATEVER<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<,'
      post 'registration', admin_user: { email: 'lol@lol.ru', password: 'password2400', password_confirmation: 'password2400' }
      puts assigns(:user)
    end
  end

end
