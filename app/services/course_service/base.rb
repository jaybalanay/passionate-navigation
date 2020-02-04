module CourseService
  class Base
    attr_reader :errors

    def initialize(params={})
      @params = params
      @errors = []
    end

    private

    attr_reader :params

    def course_params
      params.require(:course).permit(:name, :author, :state)
    end
  end
end
