class ApplicationController < ActionController::Base
  def self.search(search_params)
    where("name ILIKE ?", "%#{search_params}%")
  end
end
