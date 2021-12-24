class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services

  def geocode(service: GoogleMapsAPI)
    lat, lng = service.geocode(address)

    update(
      latitude: lat,
      longitude: lng
    )
  end
end


class FakeMapsAPI
  def self.geocode(address)
    [1,1]
  end
end
