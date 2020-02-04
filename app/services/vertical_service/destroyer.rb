module VerticalService
  class Destroyer < Base

    def destroy
      vertical.destroy
    end

    private
    def vertical
      @vertical = Vertical.find_by(id: params[:id])
    end
  end
end
