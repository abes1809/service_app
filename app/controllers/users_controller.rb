class UsersController < ApplicationController

  def show 
    @user = User.find(params[:id])

    render 'show.json.jbuilder'

  end 

  def create
    @contact_info = ContactInfo.new(
                                     email: params[:email],
                                     phone_number: params[:phone_number],
                                     address: params[:address],
                                     state: params[:state],
                                     city: params[:city],
                                     zip: params[:zip],
                                     prefered_contact_method: params[:prefered_contact_method],
                                   )

     if @contact_info.address == ""
       full_address = @contact_info.zip 
     else
       full_address = @contact_info.address + ", " + @contact_info.city + ", " + @contact_info.state
     end

     @contact_info.full_address = full_address

    puts "_______________DOING STUFF 1____________________"

     if @contact_info.save
     else 
       render json: {errors: @contact_info.errors.full_messages}, status: :unprocessable_entity
       exit 
     end

    puts "_______________DOING STUFF 2____________________"
    puts @contact_info.as_json


    @user = User.new(
                    name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation],
                    contact_info_id: @contact_info.id,
                    gender: params[:gender],
                    sex: params[:sex],
                    homeless_date: params[:homeless_date],
                    domestic_violence_survivor: params[:domestic_violence_survivor],
                    annual_income: params[:annual_income],
                    household_size: params[:household_size],
                    age: params[:age],
                    photo_id: params[:photo_id],
                    insurance: params[:insurance],
                    children: params[:children]
                  )

    if @user.save
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
      exit 
    end

    puts "_______________DOING STUFF 3____________________"


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

    puts "_______________DOING STUFF 4____________________"

    p services 
    puts "WORKING"

    services.each do |service|
      if service.qualified_user?(@user, service) 

        puts "FOUND QUALIFIED"

        @user_service = UserService.new(
                                        servicable_id: service.id,
                                        user_id: @user.id,
                                        servicable_type: service.class,
                                        status: 1,
                                        notes: "",
                                        )

        distance = @user_service.find_distance(@user_service, @user)

        puts "------------DISTANCE---------------"
        puts distance

        @user_service[:distance] = distance

        puts @user_service.as_json 

        @user_service.save
      end
    end 
  end 

  def update

    @user = User.find(params[:id])
    puts params


    @user.name = params["name"] || @user.name
    @user.email = params["email"] || @user.email 
    @user.gender = params["gender"] || @user.gender
    @user.sex = params["sex"] || @user.sex
    @user.domestic_violence_survivor = params["domestic_violence_survivor"] || @user.domestic_violence_survivor
    @user.annual_income = params["annual_income"] || @user.annual_income
    @user.household_size = params["household_size"] || @user.household_size
    @user.age = params["age"] || @user.age
    @user.photo_id = params["photo_id"] || @user.photo_id
    @user.insurance = params["insurance"] || @user.insurance
    @user.children = params["children"] || @user.children?
    @user.password = params["password"]


    @contact_info = ContactInfo.find(@user.contact_info_id)

    @contact_info.phone_number = params["phone_number"] || @contact_info.phone_number
    @contact_info.address = params["address"] || @contact_info.address
    @contact_info.state = params["state"] || @contact_info.state
    @contact_info.city = params["city"] || @contact_info.city
    @contact_info.zip = params["zip"] || @contact_info.zip

    puts "2"

    if @contact_info.address == ""
      @contact_info.full_address = params["zip"] 
    else
     @contact_info.full_address = "#{@contact_info.address}, #{@contact_info.city},  #{@contact_info.state}"
    end

    if @user.save
      puts "YEP"
    else
      puts "NOPE USER"
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end

    if @contact_info.save
      puts "YEP ContactInfo"
       p @contact_info
     else 
       render json: {errors: @contact_info.errors.full_messages}, status: :unprocessable_entity
       exit 
     end

    if params[:rematch] == "yes" 
      puts "REMMAATCHHHH"

      old_services = @user.user_services.all

      old_services.each do |old_service|
        old_service.destroy
      end 

      categories = { shelter: params["shelter"], 
                     law: params["law"],
                     mental: params["mental"] 
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

      puts "_______________DOING STUFF 4____________________"

      puts "WORKING"

      services.each do |service|
        if service.qualified_user?(@user, service) 

          puts "FOUND QUALIFIED"

          @user_service = UserService.new(
                                          servicable_id: service.id,
                                          user_id: @user.id,
                                          servicable_type: service.class,
                                          status: 1,
                                          notes: "",
                                          )

         puts "_______________DOING STUFF 5____________________"

          distance = @user_service.find_distance(@user_service, @user)
          puts "------------DISTANCE---------------"
          puts distance

          @user_service[:distance] = distance

          puts @user_service.as_json 

          @user_service.save
        end
      end 
    else 
      if params[:address] == nil 
      else 
        @user.user_services.each do |user_service|
          distance = user_service.find_distance(user_service, @user)
          puts "------------DISTANCE---------------"
          puts distance

          user_service[:distance] = distance
          puts user_service[:distance]
        end
      end 
    end 


  end 

  def text_info 

    address = params[:full_address]
    phone_number = params[:phone_number]
    website = params[:website]
    zip = params[:zip]
    address_url = address.gsub(/\s+/, "+")

    puts address_url
    # put your own credentials here
    account_sid = ENV['TWILLIO_ACCOUNT_SID']
    auth_token = ENV['TWILLIO_TOKEN']

    message = "

    Hello! Below is your requested service information!

    - Address: #{address}, 

    - Phone Number: #{phone_number},

    - Website: #{website},
    
    - Google Maps Link: https://www.google.com/maps/place/'#{address_url}'
    "

    puts message

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
      body: message,
      to: '+16303375485',
      from: ENV['TWILLIO_NUMBER']
    )

    puts message

    puts message.sid


  end 

end
