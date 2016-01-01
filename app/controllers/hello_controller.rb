require 'pry'
class HelloController < ApplicationController
  
  get '/' do
    erb :"root"
  end

  get '/kids' do
    @kids = Kid.all
    erb :"kid_index"
  end

  get '/parents' do
    @parents = Parent.all
    erb :"parent_index"
  end

  get '/playdates' do
    @playdates = Playdate.all
    # binding.pry
    erb :"playdate_index"
  end

  get '/parents/new' do
    #binding.pry
    erb :new_parent
  end

  post '/parents/new' do
    #binding.pry
    @parent = Parent.create(:name => params[:parent], :gender => params[:gender])
    redirect to "/parents/#{@parent.id}"
  end

  get '/kids/new' do
    #binding.pry
    erb :new_kid
  end

  post '/kids/new' do
    parent = Parent.find_or_create_by(:name => params[:parent])
    @kid = Kid.create(:name => params[:name], :parent => parent)
    @kid.save
      redirect to "/kids/#{@kid.id}"
  end

  get '/playdates/new' do
    #binding.pry
    erb :new_playdate
  end

  post '/playdates/new' do
    #binding.pry
    @playdate = Playdate.create(:location => params[:location])
    kid = params[:kids].collect { |kid_name| Kid.find_or_create_by(:name => kid_name)}
    @playdate.kids << kid
    #binding.pry
    redirect to "/playdates/#{@playdate.id}"
  end

  get '/kids/:id' do
    #binding.pry
    @kid = Kid.find(params[:id])
    erb :show_kid
  end

  get '/parents/:id' do
    #binding.pry
    @parent = Parent.find(params[:id])
    erb :show_parent
  end

   get '/playdates/:id' do
    #binding.pry
    @playdate = Playdate.find(params[:id])
    erb :show_playdate
  end

  get '/parents/:id/edit' do
    #binding.pry
    @parent = Parent.find(params[:id])
    erb :edit_parent
  end

  post '/parents/edit' do
    #binding.pry
    @parent = Parent.find(params[:id])
    @parent.update(name: params[:parent], gender: params[:gender])
    @parent.save
    redirect to "/parents/#{@parent.id}"
  end

  get '/kids/:id/edit' do
    #binding.pry
    @kid = Kid.find(params[:id])
    erb :edit_kid
  end

  post '/kids/edit' do
    binding.pry
    @kid = Kid.find(params[:id])
    parent = Parent.find_or_create_by(:name => params[:parent])
    @kid.update(name: params[:name], parent: parent)
    @kid.save
    redirect to "/kids/#{@kid.id}"
  end

  get '/playdates/:id/edit' do
    #binding.pry
    @playdate = Playdate.find(params[:id])
    erb :edit_playdate
  end

  post '/playdates/edit' do
    #binding.pry
    @playdate = Playdate.find(params[:id])
    kid = params[:kids].collect { |kid_name| Kid.find_or_create_by(:name => kid_name)}
    @playdate.update(location: params[:location], kids: kid)
    @playdate.save
    redirect to "/playdates/#{@playdate.id}"
  end







end
