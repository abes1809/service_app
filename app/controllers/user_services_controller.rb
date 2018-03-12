class UserServicesController < ApplicationController
  before_action :authenticate_user

  def index

    services = current_user.user_services

    @user_services = services.service_matches(services)
    
    if render 'index.json.jbuilder'

    else 
      render json: {errors: @user_services.errors.full_messages}, status: :unprocessable_entity
    end 

  end 

  def create
    service_type = params[:service_type]
      if service_type == "shelter"
        services = Shelter.all
      elsif service_type == "mental_health_service"
        services = MentalHealthService.all 
      elsif service_type == "law_service"
        services = LawService.all
      end 
    matches = 0 

    services.each do |service|
      if service.qualified_user?(current_user) 
        @user_service = UserService.new(
                                        servicable_id: service.id,
                                        user_id: current_user.id,
                                        servicable_type: service.class,
                                        status: 1,
                                        notes: ""
                                        )
        matches = matches += 1
        @user_service.save
      end
    end 

    if matches == 1 
      return 'show.json.jbuilder'
    elsif matches > 1
      return 'index.json.jbuilder'
    else
      render json: {errors: @user_services.errors.full_messages}, status: :unprocessable_entity
    end 
  end 

end
