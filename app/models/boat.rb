require 'pry'
class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  class << self
  def first_five
	limit(5)
  end

  def dinghy
  	where("length<=20")
  end

  def ship
  	where("length>=20")
  end

  def last_three_alphabetically
  	order("name desc").limit(3)
  end

  def without_a_captain
  	where("captain_id is null")
  end

  def sailboats
  	joins(:classifications).where("classifications.name = 'Sailboat'")
  end

  def with_three_classifications
  	joins(:classifications).group("boats.name").having("count() = 3")
  end
  end

end
