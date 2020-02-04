# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController

      def index
        @categories = Category.all
        render json: { categories: @categories }
      end

      def show
        render json: { category: Category.find_by(id: params[:id], vertical_id: params[:vertical_id]) }
      end

      def create
        client    = CategoryService::Creator.new(params)
        category  = client.create

        json_response, status = if category
                                  [{ category: category }, :ok]
                                else
                                  [{ error: client.errors }, :bad_request]
                                end

        render json: json_response, status: status
      end

      def update
        client    = CategoryService::Updater.new(params)
        category  = client.update

        json_response, status = if category
                                  [{ category: category }, :ok]
                                else
                                  [{ error: client.errors }, :bad_request]
                                end

        render json: json_response, status: status
      end

      def destroy
        client = CategoryService::Destroyer.new(params)
        client.destroy
        head :no_content
      end

    end
  end
end


