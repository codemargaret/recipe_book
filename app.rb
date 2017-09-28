require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
end

post '/recipe/new' do
  name = params["name"]
  new_recipe = Recipe.new({:name => name})
  if new_recipe.save
    redirect "/recipe/new/#{new_recipe.id}/ingredient"
  else
    erb :error # Better idea?
  end
end

###### I am used to find a recipe by tag ######
get '/recipe/find_by/tag' do

end

post '/recipe/find_by/tag' do

end
################################################

### I am used to find a recipe by ingredient ###
get '/recipe/find_by/ingredient' do

end

post '/recipe/find_by/ingredient' do

end
################################################

### In this route the user will add ingredients ###
get '/recipe/new/:id/ingredient' do
  @recipe = Recipe.find(params[:id])
  @units = Unit.all
  erb :add_ingredient
end

post '/recipe/new/:id/ingredient' do
  ingredient_name = params["name"]
  quantity = params["quantity"]
  unit_id = params["unit"]
  new_ingredient = Ingredient.create({:name => ingredient_name})
  @recipe.lists.create(:ingredient => test_ingredient, :quantity => 2, :unit_id => unit_id)
end
################################################
