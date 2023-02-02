class ArticlesController < ApplicationController
  #before_action performs this set action for only det som står i [ show, deti...]
  before_action :set_article, only: %i[ show edit update destroy ]
  #before_action :require_user, except: [:show, :index]
  #before_action :require_same_user, only: %i[ edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5) 
  end

  # GET /articles/1 or /articles/1.json
  def show
    #SKAPPAT AV MIG
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    #skapar new article on reload och vi kan få error msg
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    # @article = Article.find(params[:id])
  end

  # POST /articles or /articles.json
  def create
    # @article pga vi nehöver det outside def create
    @article = Article.new(article_params)
    @article.user = current_user 

    respond_to do |format|
      if @article.save
        #redirection to articles/:id ex: articles/7
        #notice att få msg efter vi skappat new article
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      #if article was uppdated successfully printar ut msg och pushat till json
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        #if not uppdated error msg
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    #to find article från articles table
    # @article = Article.find(params[:id])
    # sen @article.destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #any methods or actions bellow private are available only to this controller not outside
  # PRIVATE  does not need 'end' in the end AND allways in the bottom of other controllers
  # dvs sist i ex controller.rb
  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_article
      # @article = Article.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end

    # def require_same_user
    #   if current_user != @article.user
    #     #flash[:alert] = "You can only edit or delete your own article"
    #     redirect_to @article
    #   end
    # end

    private 

    def set_article
      @article = Article.find(params[:id])
    end

end
