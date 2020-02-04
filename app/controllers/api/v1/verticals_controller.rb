# frozen_string_literal: true

module Api
  module V1
    class VerticalsController < ApiController

      def index
        @verticals = Vertical.all
        render json: { verticals: @verticals }
      end

      def show
        render json: { vertical: Vertical.find_by(id: params[:id]) }
      end

      def create
        vertical_client = VerticalService::Creator.new(params)
        vertical        = vertical_client.create

        json_response, status = if vertical
                                  [{ vertical: vertical }, :ok]
                                else
                                  [{ error: vertical_client.errors }, :bad_request]
                                end

        render json: json_response, status: status
      end

      def update
        vertical_client = VerticalService::Updater.new(params)
        vertical        = vertical_client.update

        json_response, status = if vertical
                                  [{ vertical: vertical }, :ok]
                                else
                                  [{ error: vertical_client.errors }, :bad_request]
                                end

        render json: json_response, status: status
      end

      def destroy
        vertical_client = VerticalService::Destroyer.new(id: params[:id])
        vertical_client.destroy
        head :no_content
      end

    end
  end
end

