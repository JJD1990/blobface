module ApplicationHelper

    def initialize_search
        @q = User.ransack(params[:q])
    end
end
