module VerticalService
  class Updater < Base

    def update
      vertical.update(vertical_params)
      return vertical if vertical.errors.empty?

      errors << vertical.errors.full_messages
      nil
    end

    private
    def vertical
      @vertical ||= Vertical.find_by(id: params[:id])
    end
  end
end
