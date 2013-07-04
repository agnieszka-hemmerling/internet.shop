class PostsController < InheritedResources::Base

	def new
		@posts = Post.new
 end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			flash[:notice] = 'Zamowienie zostalo zrealizowane.'
			redirect_to :action => 'show', :id => @post
		else
			render :action => 'edit'
		end
end	

	def create
		@post = Post.new(params[:post])

		respond_to do |format|
			if @post.save
				format.html {	redirect_to @post, notice: 'Zamowienie zostalo zrealizowane.'  }
				format.json { render json: @post, status: :created, location: @post}
			else
				format.html {	render :action => "new" }
				format.json { render json: @post.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
		@post = Post.find(params[:id])

		respond_to do |format|
			format.html
			format.json { render json: @post }
		end
	end		
end

