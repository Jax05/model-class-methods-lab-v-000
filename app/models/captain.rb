class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    includes(boats: [:classifications]).where(classifications: {name: "Catamaran"})
  end

  def self.sailors
    includes(boats: [:classifications]).where(classifications: {name: "Sailboat"}).distinct
  end

  def talented_seafarers
    includes(boats: [:classifications]).where(classifications: {name: "Motorboat" & "Sailboat"})
  end
end
