class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :initialize_search

    def initialize_search
        @q = User.ransack(params[:q])
        @users = @q.result(distinct: true)
    end
end
