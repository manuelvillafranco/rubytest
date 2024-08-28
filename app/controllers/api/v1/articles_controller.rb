module Api
  module V1
    class ArticlesController < ApplicationController
      before_action :authorize_request
      before_action :set_article, only: [:show, :update, :destroy]

      # GET /api/v1/articles
      def index
        @articles = Article.all
        render json: @articles
      end

      # GET /api/v1/articles/:id
      def show
        render json: @article
      end

      # POST /api/v1/articles
      def create
        @article = Article.new(article_params)
        if @article.save
          render json: @article, status: :created
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/articles/:id
      def update
        if @article.update(article_params)
          render json: @article
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/articles/:id
      def destroy
        @article.destroy
        head :no_content
      end

      private

      private

      def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          @decoded = JWT.decode(header, 'your_secret_key', true, algorithm: 'HS256')
          @current_user = User.find(@decoded[0]['user_id'])
        rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { errors: e.message }, status: :unauthorized
        end
      end

      def set_article
        @article = Article.find(params[:id])
      end

      def article_params
        params.require(:article).permit(:title, :body)
      end
    end
  end
end
