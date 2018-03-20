class UsersController < ApplicationController

  def create
    @contact_info = ContactInfo.new(
                                     email: params[:email],
                                     phone_number: params[:phone_number],
                                     address: params[:address],
                                     state: params[:state],
                                     city: params[:city],
                                     zip: params[:zip],
                                     prefered_contact_method: params[:prefered_contact_method],
                                     full_address: params[:address] + ", " + params[:city] + ", " + params[:state]
                                   )

     if @contact_info.save
     else 
       render json: {errors: @contact_info.errors.full_messages}, status: :unprocessable_entity
       exit 
     end

     puts "_______________DOING STUFF 1____________________"

    @user = User.new(
                    name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation],
                    contact_info_id: @contact_info.id,
                    gender: params[:gender],
                    sex: params[:sex],
                    homeless_date: params[:homeless_date],
                    domestic_violence_survivor: params[:domestic_violence_victim],
                    annual_income: params[:annual_income],
                    household_size: params[:household_size],
                    age: params[:age]
                  )

    if @user.save
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
      exit 
    end

    puts "_______________DOING STUFF 2____________________"


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

    puts "_______________DOING STUFF 3____________________"

    puts services 
    puts "WORKING"

    services.each do |service|
      if service.qualified_user?(@user) 

        @user_service = UserService.new(
                                        servicable_id: service.id,
                                        user_id: @user.id,
                                        servicable_type: service.class,
                                        status: 1,
                                        notes: "",
                                        )
       puts "_______________DOING STUFF 4____________________"

        distance = @user_service.find_distance(@user_service, @user)
        puts "------------DISTANCE---------------"
        puts distance

        @user_service[:distance] = distance

        puts @user_service.as_json 

        @user_service.save
      end
    end 
  end 

end
