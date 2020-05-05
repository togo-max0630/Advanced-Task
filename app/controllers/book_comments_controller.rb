class BookCommentsController < ApplicationController

def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
end
def destroy
	book = Book.find(params[:book_id])
	comment = BookComment.find(params[:id])
	comment.user_id = current_user.id
	comment.book_id = book.id
	comment.destroy
	redirect_to book_path(book)
end

private
def book_comment_params
	params.require(:book_comment).permit(:comment)
end

end
