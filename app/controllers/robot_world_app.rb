
class RobotWorldApp < Sinatra::Base

  get '/' do
    @departments = robot_world.oraganize_by(:department)
    @states = robot_world.oraganize_by(:state)
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_world.all
  erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_world.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:name' do |name|
    @robot = robot_world.find(name)
    erb :show
  end

  get '/robots/:name/edit' do |name|
    @robot = robot_world.find(name)
    erb :edit
  end

  put '/robots/:name' do |name|
    robot_world.update(name, params[:robot])
    redirect "/robots/#{name}"
  end

  delete '/robots/:name' do |name|
    robot_world.delete(name)
    redirect '/robots'
  end

  def robot_world
    if ENV["RACK_ENV"] == "test"
      database = YAML::Store.new('db/robot_world_test')
    else
      database = YAML::Store.new('db/robot_world')
     end
   @robot_world ||= RobotWorld.new(database)
  end

end