class Event < ActiveRecord::Base
  validates :name, presence: true,
                      length: { minimum: 5 }
  validates :description, presence: true,
                      length: { minimum: 5 }
  validates :date, presence: true
  validates :time, presence: true 
  validates :npc, presence: true 
  validates :location,  presence: true 
end
