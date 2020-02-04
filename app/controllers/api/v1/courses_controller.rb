# frozen_string_literal: true

module Api
  module V1
    class CoursesController < ApiController

      def index
        @courses = Course.all
        render json: { courses: @courses }
      end

      def show
        category = Category.find_by(id: params[:category_id], vertical_id: params[:vertical_id])
        render json: { course: Course.find_by(id: params[:id], category_id: category.try(:id)) }
      end

      def create
        client  = CourseService::Creator.new(params)
        course  = client.create

        json_response, status = if course
                                  [{ course: course }, :ok]
                                else
                                  [{ error: client.errors }, :bad_request]
                                end

        render json: json_response, status: status
      end

      def update
        client  = CourseService::Updater.new(params)
        course  = client.update

        json_response, status = if course
                                  [{ course: course }, :ok]
                                else
                                  [{ error: client.errors }, :bad_request]
                                end

        render json: json_response, status: status
      end

      def destroy
        client = CourseService::Destroyer.new(params)
        client.destroy
        head :no_content
      end

    end
  end
end



