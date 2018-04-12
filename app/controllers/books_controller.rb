class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    @books = Book.paginate(:page => params[:page], :per_page => 10)
    @number_pages = @books.count / 10
    render json: {list: @books,pages: @number_pages.floor}
  end

  # GET /books/1
  def show
    respond_to do |format|
      format.json {render   json: @book}
      format.pdf {render template: 'books/template_pdf',pdf:'libro'}
    end
  end


  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:name, :description, :author)
    end
end
