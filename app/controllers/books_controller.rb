class BooksController < ApplicationController

  before_filter :header
  before_filter :valueslist

  def index
    @books = Book.all
    @collection = @books.paginate(:page => params[:all], :per_page => 7)
    @poc = @poc.paginate(:page => params[:poc_page], :per_page => 7)
    @lgb = @lgb.paginate(:page => params[:lgb_page], :per_page => 7)
    @trans = @trans.paginate(:page => params[:trans_page], :per_page => 7)
    @women = @women.paginate(:page => params[:women_page], :per_page => 7)
    @disability = @disability.paginate(:page => params[:disability_page], :per_page => 7)
  end


  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @values = Value.all.collect do |value|
      [value.name, value.id]
    end
    @book_values = Value.all

  end

  def create

    @book = Book.create(book_params)
    redirect_to @book
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params) do |book|
      book.reject { |k,v| v.blank? }
      end
      redirect_to @book
    else
      render :edit
    end
  end


  private

  def book_params
    params.require(:book).permit(:user_id, :description, :value, :title, :author, superlatives: [])
  end

end
