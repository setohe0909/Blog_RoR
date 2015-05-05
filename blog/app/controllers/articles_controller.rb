class ArticlesController < ApplicationController
	#GET  /articles
	def index
		@articles = Article.all
	end

	#GET /articles/:id
	def show
		@article = Article.find(params[:id])
	end

	#GET /article/new
	def new
		@article = Article.new

	end

	#GET /article/:id/edit
	def edit
		@article = Article.find(params[:id])
	end

	#POST /article
	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else 
			render :new
		end
	end

	#PUT /articles/:id
	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	#DELETE /articles/:id
	def destroy
		@articles = Article.find(params[:id])
		@articles.destroy # Destroy elimina el objeto de la base de datos
		redirect_to articles_path
	end

	private	

		def article_params
			params.require(:article).permit(:title,:body)
		end
end