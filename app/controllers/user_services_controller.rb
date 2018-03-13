class UserServicesController < ApplicationController

  def index

    services = current_user.user_services

    @user_services = services.service_matches(services)
    
    if render 'index.json.jbuilder'

    else 
      render json: {errors: @user_services.errors.full_messages}, status: :unprocessable_entity
    end 

  end 

  def create
    # categories = params[:service_type]

    # services = service_categories(categories)

    # p services

    service_type = params[:service_type]
    p service_type

     

    if service_type == "shelters"
      services = Shelter.all
    elsif service_type == "mental_health_services"
      services = MentalHealthService.all 
    elsif service_type == "law_services"
      services = LawService.all
    end 
    p current_user

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
