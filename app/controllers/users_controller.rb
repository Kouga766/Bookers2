class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])


  end

  def new
     @user_image = User.new
  end

  def create
    @user_image = User.new(user_image_params)
    @user_image.user_id = current_user.id
    @user_image.save
  end

  def index
    @user_images = User.all

  end


  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @user_image = User.find(params[:id])
    @user_image.destroy
    redirect_to post_images_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end



  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
