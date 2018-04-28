class Article < ApplicationRecord


    def self.Search(params)
        articles = Article.where("body LIKE ? or title LIKE ?" "%#{params[:search]}%",
                "%#{params[:search]}%") if params[:search].present?

        articles

    end

end
