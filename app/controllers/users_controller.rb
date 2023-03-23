class UsersController < ApplicationController

  def new
   @users=User.new
   flash[:notice] = "Welcome! You have signed up successfully."
   redirect_to user_path(params[:id])
  end

  def index
   @users=User.all
   @user=current_user
   @books=Book.all
   @book=Book.new
  end

  def show
   @user=User.find(params[:id])
   @book=Book.new
   @books=@user.books
  end

  def edit
   @user=User.find(params[:id])
   unless @user.id == current_user.id
    redirect_to user_path(current_user.id)
   end
  end

  def create
   @user.save
  end

  def update
   @user=User.find(params[:id])
   if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(params[:id])
   else
    render :edit
   end
  end


  def destroy
   @book=Book.find(params[:id])
   @book.destroy
   redirect_to '/books'
  end

  private
  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
