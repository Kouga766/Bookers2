class BooksController < ApplicationController

  def new
     @book = Book.new
  end

  def edit
    @books = Book.all
    @book = Book.find(params[:id])
    unless @book.user == current_user
    redirect_to books_path
    end
  end

  def create
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
     @books = Book.all
     @book = Book.new
     @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @books = Book.all
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    book = Book.find(params[:id])

    if book.update(book_params)
      flash[:createdflag] = true
      redirect_to book_path(book.id)
    else
      @book=book
      render:edit
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
