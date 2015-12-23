class ApplicationController < Sinatra::Base
  enable :method_override
  set :root, File.join(__dir__, "..")
end
