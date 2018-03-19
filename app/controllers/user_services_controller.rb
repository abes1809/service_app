class UserServicesController < ApplicationController

  def index

    services = current_user.user_services

    @user_services = services.service_matches(services)
    
    if render 'index.json.jbuilder'

    else 
      render json: {errors: @user_services.errors.full_messages}, status: :unprocessable_entity
    end 

  end 

  def show

    user = current_user

    @user_service = UserService.find(params[:id])

    @user_service = @user_service.show_match(@user_service, user)  

    render 'show.json.jbuilder'

  end 

  def update 

    @user_service = UserService.find(params[:id])

    puts params[:status]

    @user_service.status = params[:status] || @user_service.status 
    @user_service.notes = params[:notes] || @user_service.notes
    
    if @user_service.save
      @user_service = @user_service.show_match(@user_service)  
      puts @user_service.as_json
      render 'show.json.jbuilder'
    else   
      render json: {errors: @user_service.errors.full_messages}, status: :unprocessable_entity
    end 

  end

  def create_law 
  #   params = [params[:law_service], params[:mental_health_service], params[:shelter]] 

  #   puts categories

  #   puts @services.as_json

  #   if params == {law_service: true , mental_health_service: "", shelter: ""
  #     services = LawService.all

  #   elsif params == {law_service:"", mental_health_service: true, shelter: ""
  #     services = MentalHealthService.all

  #   elsif params == {law_service:"", mental_health_service: "", shelter: true
  #     services = Shelter.all

  #   elsif params == {law_service:"true", mental_health_service: true, shelter: ""
  #     services = LawService.all + MentalHealthService.all

  #   elsif params == {law_service:"true", mental_health_service: "", shelter: true
  #     services = LawService.all + Shelter.all

  #   elsif params == {law_service:"", mental_health_service: true, shelter: true 
  #     services = MentalHealthService.all + Shelter.all
 
  #   elsif params == {law_service:"true", mental_health_service: true, true
  #     services = LawService.all + MentalHealthService.all + Shelter.all 
  #   end

  #   # service_type = params[:service_type
  #   # p service_type

     

  #   # if service_type == "shelters"
  #   #   services = Shelter.all
  #   # elsif service_type == "mental_health_services"
  #   #   services = MentalHealthService.all 
  #   # elsif service_type == "law_services"
  #   #   services = LawService.all
  #   # end

      services = LawService.all

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

  def create_mental

    services = MentalHealthService.all 

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

  def create_shelter

  services = Shelter.all 

  puts current_user

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















