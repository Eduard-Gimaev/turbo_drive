class QuotesController < ApplicationController
  before_action :set_quote, only: %i[destroy]

  def index
    @quotes = Quote.all
    @quote = Quote.new
  end

  def new
    @quote = Quote.new
    @turbo = params[:turbo] != "false"
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to quotes_path, notice: "Quote was successfully created."
    else
      render :new
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: "Quote was successfully destroyed."
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
