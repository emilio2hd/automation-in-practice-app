# frozen_string_literal: true

class HomeController < BasicController
  get '/' do
    erb :home
  end

  get '/simple-login' do
    @submitted = !params['s'].nil? && !params['s'].empty?
    @user = params['user'] || {}

    erb :simple_login
  end

  get '/todo' do
    erb :todo
  end

  get '/skeletons' do
    erb :skeletons
  end

  namespace '/username-availability' do
    get { erb :username_availability }

    get '/check' do
      username_allowed = !%w[admin superadmin].include?(params['username'])

      sleep 2

      json allowed: username_allowed
    end
  end
end