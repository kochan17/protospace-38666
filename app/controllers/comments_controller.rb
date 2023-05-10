class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create] # ログインしているユーザーのみコメントを投稿できるようにする

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments.includes(:user) # 関連するコメントとユーザーを取得
      flash.now[:alert] = 'コメントを投稿できませんでした。'
      render 'prototypes/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id]) # textをcontentに変更
    end
end
