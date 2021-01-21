class WordsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @word = Word.new
  end
  def create
    @word = current_user.words.build(word_params)
    if @word.save
      redirect_to word_path(@word), notice: "レシピを投稿しました。"
    else
      render :new
    end
  end
  def index
    @words = Word.all.order(id: "DESC")
  end
  def show
    @word = Word.find(params[:id])
  end
  def edit
    @word = Word.find(params[:id])
    if @word.user != current_user
        redirect_to words_path, alert: "不正なアクセスです。"
    end
  end
  def update
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to word_path(@word), notice: "レシピを更新しました。"
    else
      render :edit
    end
  end
  def destroy
    word = Word.find(params[:id])
    word.destroy
    redirect_to user_path(word.user), notice: "レシピを削除しました。"
  end

  private
  def word_params
    params.require(:word).permit(:title, :story, :image, :comment)
  end
end
