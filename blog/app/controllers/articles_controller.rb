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

	#POST /article
	def create
		@article = Article.new(title: params[:article][:title],
							   body: params[:article][:title])
		if @article.save
			redirect_to @article
		else 
			render :new
		end
	end

	#put
	def update
		
	end
end