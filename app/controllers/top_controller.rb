class TopController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  def show
  	@users = User.all #テスト用
  end

  #フォロー申請	
  def follow
  	@followed_user = User.find(params[:id])
  	Follow.new(from_user_id: current_user.id, to_user_id: @followed_user.id).save
    redirect_to :back
  end

  #フォロー取り消し
  def nofollow
  	@followed_user = User.find(params[:id])
  	Follow.find_by(from_user_id: current_user.id, to_user_id: @followed_user.id).destroy
    redirect_to :back
  end


  #フォロワー許可
  def refollow
  	@refollow_user = User.find(params[:id])
  	Follow.new(from_user_id: current_user.id, to_user_id: @refollow_user.id).save
    redirect_to :back
  end

  #フォロワー拒否
  def norefollow
  	@refollow_user = User.find(params[:id])
  	Follow.find_by(from_user_id: @refollow_user.id, to_user_id: current_user.id).destroy
    redirect_to :back
  end


  #ブロック(相互取り消し)
  def block
  	@followed_user = User.find(params[:id])
  	Follow.find_by(from_user_id: @followed_user.id, to_user_id: current_user.id).destroy
  	Follow.find_by(from_user_id: current_user.id, to_user_id: @followed_user.id).destroy
    redirect_to :back
  end

end
