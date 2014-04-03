class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render('recipes/index.html.erb')
  end

  def new
    @tags = Tag.all
    @recipe = Recipe.new
    render('recipes/new.html.erb')
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      @tag_ids = params[:tag_list].keys
      @tag_ids.each do |id|
        @tag = Tag.find(id)
        @recipe.tags << @tag
      end
      redirect_to("/recipes/#{ @recipe.id }")
    else
      render('recipes/new.html.erb')
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    render('recipes/show.html.erb')
  end

  def edit
    @tags = Tag.all
    @recipe = Recipe.find(params[:id])
    render('recipes/edit.html.erb')
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(params[:recipe])
      @tag_ids = params[:tag_list].keys
      @tag_ids.destroy
      @tag_ids.each do |id|
        @tag = Tag.find(id)
        @recipe.tags << @tag
      end
      redirect_to("/recipes/#{ @recipe.id }")
    else
      render('recipes/edit.html.erb')
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to("/recipes")
  end

end
