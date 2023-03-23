class BooksController < ApplicationController
before_action :authenticate_user!
#before_action :ensure_user ログインしているユーザーのみが編集などできるように指定する。他の人が勝手にいじれないように。
#テストの内容ー＞他人の画面のテスト 他人の投稿編集画面 遷移できず、投稿一覧画面
#before_action :

  def new
   @users=User.new
   @book=Book.new
  end

  def index
   @books=Book.all
   @book=Book.new
   @user=current_user

  end

  def show
   @book=Book.find(params[:id])
   @user=current_user
  end

  def edit
   @book=Book.find(params[:id])
   @user=@book.user
   unless @user.id == current_user.id
    redirect_to books_path
   end
  end

  def create
   @book=Book.new(book_params)
   @book.user_id=current_user.id
   if @book.save
    flash[:notice]="You have created book successfully."
    redirect_to book_path(@book.id)
   else
    @books=Book.all
    @user=current_user
    render :index
   end
  end

  def update
   @book=Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice]="Book was successfully updated."
    redirect_to book_path(@book.id)
   else
    @books=Book.all
    render :edit
   end
  end

  def destroy
   book=Book.find(params[:id])
   book.destroy
   redirect_to '/books'
  end

  private
   def book_params
    params.require(:book).permit(:title, :body)
   end

   #def　endの記述を追加

end