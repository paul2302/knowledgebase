class ArticlesController < ApplicationController

  #immediate plain article for validation purposes
  def new
    @article = Article.new
  end

  #action for displaying an article selected for editing
  def edit
    @article = Article.find(params[:id])
  end

  #action for updating a selected article
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      translate_art
      redirect_to @article
    else
      render 'edit'
    end
  end


  #action for showing all articles
  def index
    @articles = Article.all
  end

  #action for showing a specific article
  def show
    @article = Article.find(params[:id])
  end


  #action for creating an article
  def create
    @article = Article.new(article_params)

    if @article.save
      translate_art
      redirect_to @article
    else
      render 'new'
    end
  end

  #action for deleting an article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


  #deny malformed requests

  private

  def translate_art
    @article.germanquestion = translate_to_german(@article.question)
    @article.germananswer = translate_to_german(@article.answer)
    @article.save
  end

  def translate_to_german(text)
    begin
      translation = Rufregle.new.translate(text, "en", "de")
      return translation[:translated]
    rescue NoMethodError
      return ""
    end
  end

  def article_params
    params.require(:article).permit(:question, :answer)
  end
end
