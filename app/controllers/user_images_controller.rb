class UserImagesController < ApplicationController

	def new
		@user_image = UserImage.new
	end

	def create
		@user_image = UserImage.new(user_image_params)
		@user_image.user_id = current_user.id
		@user_image.save
		redirect_to users_path
	end

	def index
	end

end
