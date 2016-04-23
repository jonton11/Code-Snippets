class SnippetsController < ApplicationController # :nodoc:
  def new
    @snippet = Snippet.new
  end

  def create
    snippet_params = params.require(:snippet).permit(:title, :work, :kind_id)
    @snippet = Snippet.new snippet_params

    if @snippet.language != 'Markdown'
      @snippet.work = "```#{@snippet.language}\n" + @snippet.work + "\n```"
    end
    if @snippet.save
      redirect_to @snippet, notice: 'Snippet saved'
    else
      flash[:alert] = 'Snippet was invalid'
      render :new
    end
  end

  def edit
    @snippet = Snippet.find params[:id]
  end

  def update
    @snippet = Snippet.find params[:id]
    snippet_params = params.require(:snippet).permit(:title, :work, :kind_id)

    if @snippet.language != 'Markdown'
      @snippet.work = "```#{@snippet.language}\n" + @snippet.work + "\n```"
    end
    # Still a little buggy, update doesn't always add the markdown tags
    if @snippet.update snippet_params
      redirect_to snippet_path(@snippet), notice: 'Updated!'
    else
      render :edit
    end
  end

  def index
    @snippets = Snippet.all
    @kinds    = Kind.all
  end

  def show
    @snippet = Snippet.find params[:id]
  end
end
