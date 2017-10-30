class PagesController < ApplicationController
  def index
  end

  def home
      @beets = Beet.all
      @newBeet = Beet.new
  end

  def profile
      if (User.find_by_username(params[:id]))
          @username = params[:id]
      else
          redirect_to root_path, :notice => "User not found"
      end

      @beets = Beet.all.where("user_id = ?", User.find_by_username(params[:id]).id)
      @newBeet = Beet.new

      @toFollow = User.all.last(5)
  end

  def explore
      @beets = Beet.all
      @newBeet = Beet.new
      @toFollow = User.all.last(5)
  end
end
