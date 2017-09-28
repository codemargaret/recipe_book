require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @recipes = Recipe.where("rating >= 4").limit(3)
  erb :index
end

post '/recipe/new' do
  name = params["name"]
  new_recipe = Recipe.new({:name => name})
  if new_recipe.save
    redirect "/recipe/new/#{new_recipe.id}/ingredient"
  else
    erb :error # Change to redirect route
  end
end
#
# ###### I am used to find a recipe by tag ######
# get '/recipe/find_by/tag' do
#
# end
#
# post '/recipe/find_by/tag' do
#
# end
# ################################################
#
# ### I am used to find a recipe by ingredient ###
# get '/recipe/find_by/ingredient' do
#
# end
#
# post '/recipe/find_by/ingredient' do
#
# end
# ################################################
#
### In this route the user will add ingredients ###
get '/recipe/new/:id/ingredient' do
  @recipe = Recipe.find(params[:id])
  @units = Unit.all
  @ingredients = Ingredient.all()
  erb :add_ingredient
end

# ADD an ingredient
post '/recipe/new/:id/ingredient/add' do
  # Grab data from form
  ingredient_id = params["ingredient_id"]
  quantity = params["quantity"]
  unit_id = params["unit_id"]
  # Find the recipe we are creating
  new_recipe = Recipe.find(params[:id])
  # Find the ingredient
  an_ingredient = Ingredient.find(ingredient_id)
  # Create an entry in List Table that associates our recipe with a given ingredient, quantity, and unit measurement
  new_recipe.lists.create(:ingredient => an_ingredient, :quantity => quantity, :unit_id => unit_id)
  # Puts us back on the add ingredient GET route so that we can add more ingredients
  redirect "/recipe/new/#{new_recipe.id}/ingredient"
end

# CREATE and ADD an ingredient
post '/recipe/new/:id/ingredient/create' do
  # Grab data from form
  ingredient_name = params["name"]
  quantity = params["quantity"]
  unit_id = params["unit_id"]
  # Find the recipe we are creating
  new_recipe = Recipe.find(params[:id])
  # Create a new ingredient
  new_ingredient = Ingredient.create({:name => ingredient_name})
  new_recipe.lists.create(:ingredient => new_ingredient, :quantity => quantity, :unit_id => unit_id)
  redirect "/recipe/new/#{new_recipe.id}/ingredient"
end

#In this route the user will add steps to their recipe
get '/recipe/new/:id/step' do
  @recipe = Recipe.find(params[:id])
  @steps = Step.all
  erb :create_step
end

#CREATE and ADD a step
post '/recipe/new/:id/step/create' do
  step_name = params["name"]
  new_recipe = Recipe.find(params[:id])
  new_step = Step.create({:name => step_name, :recipe_id => params[:id], :num => new_recipe.steps.count + 1})
  redirect "/recipe/new/#{new_recipe.id}/step"
end
# ################################################
