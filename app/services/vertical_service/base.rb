module VerticalService
  class Base
    attr_reader :errors

    def initialize(params={})
      @params = params
      @errors = []
    end

    private

    attr_reader :params

    def vertical_params
      params.require(:verticals).permit(:name)
    end
  end
end
