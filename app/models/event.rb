class Event < ApplicationRecord
  def self.search_events(param)
    Event.where('name like ? OR zip_code like ?', "%#{param}%", "%#{param}%")
  end
end
