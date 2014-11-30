module Api
  class UsersController < Api::BaseController

    private

      def user_params
        params.require(:user).permit(:name, :phone, :roll_no, :email)
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:name, :phone, :roll_no, :email)
      end

  end
end