class AdminsController < ApplicationController
  def show
  	@admin = Admin.find(param[:id])
  	@posts = admin.posts
  end
end