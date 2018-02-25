class ServicesController < ApplicationController

  def index 

    @services = LawService.all + MentalHealthService.all + Shelter.all 

    service_category = params[:category]

    if service_category
      if service_category == "law" 
        @services = LawService.all
      elsif service_category.include?("mental")
        @services = MentalHealthService.all
      elsif service_category.include?("shelter")
        @services = Shelter.all 
      end 
    end 

    render 'index.json.jbuilder'
  end 
  
end
