module CategoryService
  class Updater < Base

    def update
      if category
        category.update(category_params)
        return category if category.errors.empty?

        errors << category.errors.full_messages
        nil
      else
        errors << "Category not found."
        nil
      end
    end

    private
    def category
      @category ||= Category.find_by(id: params[:id], vertical_id: params[:vertical_id])
    end
  end
end
