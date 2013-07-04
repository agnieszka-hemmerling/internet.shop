class OrdersController < InheritedResources::Base
 before_filter :authenticate_user!, :except => [ :new,:create,:show ]

	def index
		@orders = Order.all
    render layout: 'orders_index'
	end
	
	def show
		@order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
	end

  def new
    # params[:product_id] to jest => orders/new?product_id=2
    @order = Order.new
    @zamawiany_produkt = Product.find_by_id(params[:product_id])
  end

  def create
    logger.debug params
    @order = Order.new params[:order]
    @zamawiany_produkt = Product.find_by_id(params[:product_id])
    @order.products << @zamawiany_produkt

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order , :notice => 'Zamowienie zrealiwowane, Dziekuje !' }

      else
        format.html { render :action => "new" }
      end
    end
  end
end
