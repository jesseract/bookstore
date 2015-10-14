class CartsController < InheritedResources::Base

  def update
    
  end


  private

    def cart_params
      params.require(:cart).permit()
    end
end

