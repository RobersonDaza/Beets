class BeetsController < ApplicationController
    def new
        @beet = Beet.new
    end

    def create
        @beet = Beet.new(beet_params)
        @beet.user_id = current_user.id
        respond_to do |f|
            if (@beet.save)
                f.html {redirect_to "", notice: "Beet created!"}
            else
                f.html {redirect_to "", notice: "Error: Beet Not Saved."}
            end
        end
    end

    private
    def beet_params
        params.required(:beet).permit(:user_id, :content)
    end
end
