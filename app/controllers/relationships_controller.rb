class RelationshipsController < ApplicationController

    def follow
	    current_user.follow(params[:id])
	    redirect_to request.referer
    end

    def unfollow
	    current_user.unfollow(params[:id])
	    redirect_to request.referer
    end

    def FollowandFollower
        @user = current_user
        @users = User.all #一覧表示するためにUserモデルのデータを全て変数に入れて取り出す。

    end


end
