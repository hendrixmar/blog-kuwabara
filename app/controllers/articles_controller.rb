class ArticlesController < ApplicationController
    

    def index
        @articles = Article.all
    end

    def new

    end
    def show
        @article = Article.find(params[:id])

    end
    def create

            #    render plain: params[:article].inspect
            @article = Article.new(article_params)
            # instance variable that would be use in other places in our  blog application
            # to access the parameters
            @article.save
            redirect_to @article
    end

    def destroy

        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path

    end

    def edit

        @article = Article.find(params[:id])

    end

    def search
        if params[:search].blank?
            @articles = Article.all
        else
            @articles = Article.search(params)
        end

    end

    def update

        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end


private
    def article_params
        params.require(:article).permit(:title,:text)
    end
end
