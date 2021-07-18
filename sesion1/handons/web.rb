require 'sinatra'

get '/messages/:name' do
    name = params['name']
    "<h1 style=\"background-color:DodgerBlue;\">Hello #{name}!</h1>"
end

get '/messages' do
    name = params['name']
    color = params['color'].nil? ? 'DodgerBlue' : params['color']
    erb :messages, locals: {
        color: 'DodgerBlue',
        name: 'World'
    }
end

get '/login' do
    erb :login
end

post '/login' do
    if params['username'] == 'admin' && params['password'] == 'admin'
        return 'Logged in !'
    else
        redirect '/login'
    end
end
