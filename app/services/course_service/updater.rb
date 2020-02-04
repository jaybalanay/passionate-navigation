module CourseService
  class Updater < Base

    def update
      if course
        course.update(course_params)
        return course if course.errors.empty?

        errors << course.errors.full_messages
        nil
      else
        errors << "Course not found."
        nil
      end
    end

    private
    def course
      @course ||= Course.find_by(id: params[:id], category: category)
    end

    def category
      @category ||= Category.find_by(id: params[:category_id], vertical_id: params[:vertical_id])
    end
  end
end
