class Admin::ArticlesController < Admin::ApplicationController
  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  def create
    @article = Article.new(article_params.merge(user: current_user))

    if @article.save
      redirect_to admin_article_path(@article), notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to admin_article_path(@article), notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article = Article.find(params[:id])

    @article.destroy

    redirect_to admin_articles_path, notice: 'Article was successfully destroyed.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :bootsy_image_gallery_id, :featured_image)
    end
end
