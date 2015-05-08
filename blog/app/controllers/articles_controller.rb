class ArticlesController < ApplicationController
	#before_action :validate_user, except: [:show, :index]
	before_action :authenticate_user!, except: [:show, :index]
	before_action :set_article, except: [:index,:new, :create]

	#GET  /articles
	def index
		@articles = Article.all
	end

	#GET /articles/:id
	def show
		@article.update_visits_count
	end

	#GET /article/new
	def new
		@article = Article.new

	end

	#GET /article/:id/edit
	def edit

	end

	#POST /article
	def create
		@article = current_user.article.new(article_params)
		if @article.save
			redirect_to @article
		else 
			render :new
		end
	end

	#PUT /articles/:id
	def update
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	#DELETE /articles/:id
	def destroy
		@articles.destroy # Destroy elimina el objeto de la base de datos
		redirect_to articles_path
	end

	private	

		#def validate_user
		#	redirect_to new_user_sessions_path, notice: "Necesitas iniciar sesión"
		#end
		
		def set_article
			
		@articles = Article.find(params[:id])
		end

		def article_params
			params.require(:article).permit(:title,:body)
		end
end