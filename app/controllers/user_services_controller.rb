class UserServicesController < ApplicationController

  def index

    puts current_user

    services = current_user.user_services

    @user_services = services.index_matches(services, current_user)
    
    if render 'index.json.jbuilder'

    else 
      render json: {errors: @user_services.errors.full_messages}, status: :unprocessable_entity
    end 

  end 

  def show

    @user_service = UserService.find(params[:id])

    @user_service = @user_service.show_match(@user_service, current_user)

    p @user_service

    render 'show.json.jbuilder'

  end 

  def update 

    @user_service = UserService.find(params[:id])

    @user_service.status = params[:status] || @user_service.status 
    @user_service.notes = params[:notes] || @user_service.notes
    
    if @user_service.save

    else   
      render json: {errors: @user_service.errors.full_messages}, status: :unprocessable_entity
    end 

  end

  def create 

      categories = { shelter: params[:shelter], 
                     law: params[:law],
                     mental: params[:mental] 
                   }

      if categories == {shelter:true, law:true, mental:true }
        services = Shelter.all + LawService.all + MentalHealthService.all 
      elsif categories == {shelter:true, law:true, mental:false }
        services = Shelter.all + LawService.all 
      elsif categories == {shelter:true, law:false, mental:true } 
        services = Shelter.all + MentalHealthService.all
      elsif categories == {shelter:false, law:true, mental:true }
        services = LawService.all + MentalHealthService.all
      elsif categories == {shelter:true, law:false, mental:false }
        services = Shelter.all
      elsif categories == {shelter:false, law:true, mental:false } 
        services = LawService.all 
      elsif categories == {shelter:false, law:false, mental:true }
        services = MentalHealthService.all
      end

      matches = 0 

      services.each do |service|
        if service.qualified_user?(current_user, service) 

          @user_service = UserService.new(
                                          servicable_id: service.id,
                                          user_id: current_user.id,
                                          servicable_type: service.class,
                                          status: 1,
                                          notes: "",
                                          )

          distance = @user_service.find_distance(@user_service, current_user)
          puts "------------DISTANCE---------------"
          puts distance

          @user_service[:distance] = distance

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

