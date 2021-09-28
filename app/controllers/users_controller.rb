class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    @book = Book.new
  end

  def new
     @user_image = User.new
  end

  def create
    @user_image = User.new(user_image_params)
    @user_image.user_id = current_user.id
    @user_image.save

     @book = Book.new(book_params)
     @book.user_id = current_user.id
    if @book.save
      flash[:createdflag] = true
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render:index
    end
  end

  def index
    @user_images = User.all
    @user = User.all
    @books = Book.all
    @book = Book.new
  end


  def edit
    @user = User.find(params[:id])
     @user = User.new
     @user_id = current_user.id
    if @user.save
      flash[:createdflag] = true
      redirect_to edit_user_path(@user.id)
    else
      @users=User.all
      render:edit

    end
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
    params.require(:user).permit(:name, :profile_image, :introduction)
  end



  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
