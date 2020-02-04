module VerticalService
  class Creator < Base

    def create
      return vertical if vertical.save

      errors << vertical.errors.full_messages
      nil
    end

    private
    def vertical
      @vertical ||= Vertical.new(vertical_params)
    end
  end
end
