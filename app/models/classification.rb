class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    select(:name)
  end

  def self.longest
    # Boat.all.order("length desc").first.classifications
    includes(:boats).order("length desc").limit(1)
  end
end
