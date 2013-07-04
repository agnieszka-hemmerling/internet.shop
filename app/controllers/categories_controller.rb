class CategoriesController < InheritedResources::Base
  def index
    @categories = Category.all
    respond_to do |format|
			format.html
			format.json { render json:@categories } 
		end  		  
  end

   def show
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end
 
  def edit
  end

  def create 
  end  

  def destroy
  end
end
