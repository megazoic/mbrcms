require 'sinatra/base'

module MemberTracker
  class API < Sinatra::Base
    get '/show/member/:id' do
      'success'
    end
    post '/save/member' do
      mbr_id = 24
      redirect "/show/member/#{mbr_id}" 
    end
  end
end
