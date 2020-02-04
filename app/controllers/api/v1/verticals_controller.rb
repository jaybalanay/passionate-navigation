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
        client    = VerticalService::Creator.new(params)
        vertical  = client.create

        json_response, status = if vertical
                                  [{ vertical: vertical }, :ok]
                                else
                                  [{ error: client.errors }, :bad_request]
                                end

        render json: json_response, status: status
      end

      def update
        client    = VerticalService::Updater.new(params)
        vertical  = client.update

        json_response, status = if vertical
                                  [{ vertical: vertical }, :ok]
                                else
                                  [{ error: client.errors }, :bad_request]
                                end

        render json: json_response, status: status
      end

      def destroy
        client = VerticalService::Destroyer.new(params)
        client.destroy
        head :no_content
      end

    end
  end
end

