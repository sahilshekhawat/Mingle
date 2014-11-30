module Api
  class TravelsController < Api::BaseController

    private

      def user_params
        params.require(:travel).permit(:tlatitude, :tlongitude, :flatitude, :flongitude, :from, :to, :datetime, :user_id, :medium)
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:tlatitude, :tlongitude, :flatitude, :flongitude, :from, :to, :datetime, :user_id, :medium)
      end

  end
end