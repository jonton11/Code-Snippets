class SnippetsController < ApplicationController

  def new
    @snippet = Snippet.new
  end

  def create
    snippet_params = params.require(:snippet).permit(:title, :work)

    @snippet = Snippet.new snippet_params

    if @snippet.save
      redirect_to @snippet, notice: "Snippet saved"
    else
      flash[:alert] = "Snippet was invalid"
      render :new
    end
  end

  def edit
    @snippet = Snippet.find params[:id]
  end

  def update
    @snippet = Snippet.find params[:id]
    snippet_params = params.require(:snippet).permit(:title, :work)
    if @snippet.update snippet_params
      redirect_to snippet_path(@snippet), notice: "Updated!"
    else
      render :edit
    end
  end

  def index
    @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.find params[:id]
  end

end
