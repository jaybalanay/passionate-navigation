module CategoryService
  class Base
    attr_reader :errors

    def initialize(params={})
      @params = params
      @errors = []
    end

    private

    attr_reader :params

    def category_params
      params.require(:category).permit(:name, :state)
    end
  end
end
