module CategoryService
  class Creator < Base

    def create
      return category if category.save

      errors << category.errors.full_messages
      nil
    end

    private
    def category
      @category ||= Category.new(category_params.merge(vertical: vertical))
    end

    def vertical
      @vertical ||= Vertical.find_by(id: params[:vertical_id])
    end
  end
end
