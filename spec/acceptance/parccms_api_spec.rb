require 'rack/test'
require_relative '../../app/api'
module MemberTracker
  RSpec.describe 'Member Tracker API' do
    include Rack::Test::Methods
    def app
      MemberTracker::API.new
    end
    def post_member(member)
      #convert hash to string before POST
      m = hash_to_query_string(member)
      post '/save/member', m
      follow_redirect!
      expect(last_response.status).to eq(200)
      url = /(\/show\/member\/)(\d+)/.match(last_request.url)
      expect(url[2]).to match(/\d+/)
      expect(url[1]).to eq("/show/member/")
      member.merge(id: url[2])
    end
    def hash_to_query_string(h)
      m = ""
      h.each do |k,v|
        m << "#{k}=#{v}&"
      end
      m.delete_suffix!('&')
    end
    it 'records submitted member' do
      memberN = {
        fname: 'Nick',
        lname: 'Appelmans',
        call: 'KI7PTT',
        paid_up: 0
      }
      m = hash_to_query_string(memberN)
      post '/save/member', m
      follow_redirect!
      expect(last_request.url).to match(/\/show\/member\/\d+/)
      expect(last_response.body).to match("success")
    end
    context 'when a set of query parameters has been chosen' do
      it 'retrieves members by paid_up status' do
        #working with hashes returned by post_member method
        memberN = post_member(
          fname: 'Nick',
          lname: 'Appelmans',
          call: 'KI7PTT',
          paid_up: 0
        )
        memberD = post_member(
          fname: 'Dick',
          lname: 'Appelmans',
          call: 'KI7LTT',
          paid_up: 1
        )
        memberS = post_member(
          fname: 'Sick',
          lname: 'Appelmans',
          call: 'KI7LTT',
          paid_up: 1
        )
        post '/query?paid_up=0' do
          expect(last_response.status).to eq(200)
          members = URI.decode_www_form(last_response.body)
          #members = JSON.parse(last_response.body)
          expect(members).to contain_exactly(memberN)
        end
      end
    end
  end
end
