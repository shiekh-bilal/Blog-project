class Api::V1::ArticlesController < ApplicationController


    def index
        @articles = Article.all
        render json: @articles
    end
    def show
        @article = Article.find(params[:id])
        render json: @article
    end
    
    def create
        @article = current_user.articles.new(article_params)
    
        if @article.save
          render json: @article, status: :created, location: @article
        else
          render json: @article.errors, status: :unprocessable_entity
        end
    end

    def update
        if @article.update(article_params)
          render status: :no_content
        else
          render status: :unprocessable_entity
        end
    end
    def delete
        render status: :no_content if @article.destroy
    end

    private

        def article_params
            params.require(:article).permit(:title, :body, :status, :avatar,:user_id,:id)
        end
end