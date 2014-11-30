class Travel < ActiveRecord::Base
  belongs_to :user
  
  geocoded_by :to, latitude: :tlatitude, longitude: :tlongitude
  geocoded_by :from, latitude: :flatitude, longitude: :flongitude
  after_validation  :geocode_both
  serialize :collaborators, Array

  def geocode_both
    end_coordinates = Geocoder.coordinates(self.to)
    start_coordinates = Geocoder.coordinates(self.from)
    self.tlatitude = end_coordinates.first
    self.tlongitude	= end_coordinates.last
    self.flatitude = start_coordinates.first
    self.flongitude = start_coordinates.last
  end
end
