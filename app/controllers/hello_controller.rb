class HelloController < ApplicationController
  get '/oh_hai' do
    erb :"hello/oh_hai"
  end
end
