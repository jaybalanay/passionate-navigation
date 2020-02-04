module CourseService
  class Creator < Base

    def create
      return course if course.save

      errors << course.errors.full_messages
      nil
    end

    private
    def course
      @course ||= Course.new(course_params.merge(category: category))
    end

    def category
      @category ||= Category.find_by(id: params[:category_id], vertical_id: params[:vertical_id])
    end
  end
end
