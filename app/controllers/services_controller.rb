class ServicesController < ApplicationController

  def index 

    @services = LawService.all + MentalHealthService.all + Shelter.all 

    service_category = params[:category]

    if service_category
      if service_category == "law" 
        @services = LawService.all
      elsif service_category == "mental"
        @services = MentalHealthService.all
      elsif service_category == "shelter"
        @services = Shelter.all 
      end 
    end

    render 'index.json.jbuilder'
  end 

  def show 

    service_category = params[:category]

    if service_category == "law" 
      @services = LawService.find(params[:id])
    elsif service_category == "mental"
      @services = MentalHealthService.find(params[:id])
    elsif service_category == "shelter"
      @services = Shelter.find(params[:id]) 
    end 

    render 'show.json.jbuilder'

  end 
  
end
