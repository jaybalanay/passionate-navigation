module CourseService
  class Destroyer < Base

    def destroy
      Rails.logger.info(">>>>> CATEGORY: #{@category.inspect}  -- PARAMS: #{params} <<<<<")
      course.destroy
    end

    private
    def course
      @course = Course.find_by(id: params[:id], category: category)
    end

    def category
      @category ||= Category.find_by(id: params[:category_id], vertical_id: params[:vertical_id])
    end
  end
end
