require 'sinatra'

brand = [
    {merk: "Honda", motorcycle: ["Mio","Jupiter MX","RX King"]},
    {merk: "Yamaha", motorcycle: ["Beat", "Revo", "CBR"]}
]

get '/motor' do     #name endpoint tidak boleh sama dengan verbnya
    erb :merk
end

get '/motor' do
    merk = params['merk']
    motor = brand.select {|item| item[:merk] == merk}.last
    return "#{motor[:motorcycle]}"
end