class RobotWorldApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robot = RobotWorld.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    RobotWorld.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id/edit' do |id|
    @Robot = RobotWorld.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    RobotWorld.update(id.to_i , params[:robot])
    redirect "robots/#{id}"
  end

  get '/robots/:id' do |id|
    @robot = RobotWorld.find(id.to_i)
    erb :show
  end

  delete '/robots/:id' do |id|
    RobotWorld.delete(id.to_i)
    redirect '/robots'
  end




end
