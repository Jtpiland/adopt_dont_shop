class AdminsController < ApplicationController
  def index
    @shelters = Shelter.find_by_sql "SELECT * FROM shelters ORDER BY name ASC"
    # require "pry"; binding.pry
  end
end
