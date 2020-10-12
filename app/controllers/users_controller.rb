class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users.to_json(user_serializer)
end

def show
    @user = User.find(params["id"])
    render json: @user.to_json(user_serializer)
end


private
def user_serializer
        {
            :only => [:id, :email],
                :include => [:transactions]
        }
end

end
