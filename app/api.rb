require 'sinatra/base'
require_relative 'register'

module MemberTracker
  class API < Sinatra::Base
    def initialize(register: Register.new)
      @register = register
      super()
    end
    get '/show/member/:id' do
      status 404
      "member_id=#{params[:member_id]}"
    end
    post '/save/member' do
      req_b = request.body.read
      result = @register.record(req_b)
      #'member_id=417'
      mbr_id = /.*=(\d+)/.match(result)[0]
      redirect "/show/member/#{mbr_id}" 
    end
    post '/query' do
      query_keys = [:paid_up, :mbr_full, :mbr_student]
      @resp = []
      query_keys.each do |k|
        if ["", nil].include?(params[k])
          #skip
        else
          case k
          when :paid_up
            if params[k] == '0'
              #@resp = {{:fname=>"nick",:call=>"KI7"},{:fname=>"dick",:call=>"W2"}}
              @resp = [["q", "ruby"], ["lang", "en"]]
            elsif params[k] == '1'
            else #looking for both
            end
          else
            puts 'error'
          end
        end
      end
      URI.encode_www_form(@resp)
    end
  end
end
