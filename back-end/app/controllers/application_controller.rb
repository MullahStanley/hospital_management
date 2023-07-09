class ApplicationController < ActionController::Base
    def index
        render plain: 'Welcome to the homepage!'
      end
end
