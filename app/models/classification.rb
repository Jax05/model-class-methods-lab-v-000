class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    select(:name)
  end

  def self.longest
    # Boat.all.order("length desc").first.classifications
    joins(:boats).order("length desc").select(:classifications)
  end
end
