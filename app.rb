require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/favorites')
require("rspec")
require("pry")

get('/') do
  @list = Item.all()
  erb(:list)
end

post('/') do
  name = params["name"]
  rank = params["rank"]
  item = Item.new(name,rank)
  @rank = item.rank
  item.save()
  @list= Item.sort()
  erb(:list)
end
post('/delete') do
  del = params["del"]
  delete = Item.delete(del)
  @list= Item.sort()
  erb(:list)
end
get('/items/:id') do
  @item = Item.find(params[:id])
  erb(:item)
end
