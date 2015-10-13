class LineItemsController < InheritedResources::Base

  private

    def line_item_params
      params.require(:line_item).permit(:book_id, :cart_id)
    end
end

