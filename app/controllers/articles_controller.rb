class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'dhh', password: 'secret',
                               except: %i[index show]
  # before_action :authenticate_user!, except: [:index, :show, :home]
  # before_action :correct_user, only: [:edit, :update, :destroy]

  def home; end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = current_user.articles.new(article_params)
    authorize @article

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    authorize @article
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status, :avatar)
  end

  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to articles_path, notice: 'Not Authorized to Edit this article' if @article.nil?
  end
end
