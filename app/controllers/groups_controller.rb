class GroupsController < ApplicationController
  def new
  end

  def create
    @group = Group.create(group_name: params[:group_name], group_description: params[:group_description])
  end
end
