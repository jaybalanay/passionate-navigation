module VerticalService
  class Updater < Base

    def update
      if vertical
        vertical.update(vertical_params)
        return vertical if vertical.errors.empty?

        errors << vertical.errors.full_messages
        nil
      else
        errors << "Vertical not found."
        nil
      end
    end

    private
    def vertical
      @vertical ||= Vertical.find_by(id: params[:id])
    end
  end
end
