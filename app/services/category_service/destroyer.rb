module CategoryService
  class Destroyer < Base

    def destroy
      category.destroy
    end

    private
    def category
      @category = Category.find_by(id: params[:id], vertical_id: params[:vertical_id])
    end
  end
end
