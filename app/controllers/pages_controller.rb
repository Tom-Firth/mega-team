class PagesController < ApplicationController
	skip_before_action :authenticate_user!
  def home
  	if user_signed_in?
	 redirect_to articles_path
	end
  end

end
