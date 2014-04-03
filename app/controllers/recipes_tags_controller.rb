class RecipesTagsController < ApplicationController
  def new
    tag = Tag.new
    @tag_id = tag.id
  end

end
