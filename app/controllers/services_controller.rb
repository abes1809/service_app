class ServicesController < ApplicationController

  def index 

    @services = LawService.all + MentalHealthService.all + Shelter.all 

    service_category = params[:category]

    if service_category
      if service_category.include?("law")
        @services = LawService.all
      elsif service_category.include?("mental")
        @services = MentalHealthService.all
      elsif service_category.include?("shelter")
        @services = Shelter.all 
      end 
    end 

    render 'index.json.jbuilder'
  end 

  def create 
    service_category = params[:category]

    
    if service_category == "LawService"
      
      @service = LawService.new(
                                name: params[:name],
                                specialty: params[:specialty],
                                contact_info_id: params[:contact_info_id],
                                )

      if @service.save 
         render json: {
                      name: @service.name, 
                      specialty: @service.specialty, 
                      contact_info_id: @service.contact_info_id,
                      email: @service.contact_info.email,
                      phone_number: @service.contact_info.phone_number,
                      address: @service.contact_info.address,
                      city: @service.contact_info.city,
                      state: @service.contact_info.state,
                      zip: @service.contact_info.zip,
                      prefered_contact_method: @service.contact_info.prefered_contact_method,
                    }
      else 
        render json: {errors: @service.errors.full_messages}, status: :unprocessable_entity
      end 

    elsif service_category == "MentalHealthService"

      @service = MentalHealthService.new(
                                        name: params[:name],
                                        specialty: params[:specialty],
                                        contact_info_id: params[:contact_info_id],
                                        )

      if @service.save 
        render json: {
                      name: @service.name, 
                      specialty: @service.specialty, 
                      contact_info_id: @service.contact_info_id,
                      email: @service.contact_info.email,
                      phone_number: @service.contact_info.phone_number,
                      address: @service.contact_info.address,
                      city: @service.contact_info.city,
                      state: @service.contact_info.state,
                      zip: @service.contact_info.zip,
                      prefered_contact_method: @service.contact_info.prefered_contact_method,
                    }
      else 
        render json: {errors: @service.errors.full_messages}, status: :unprocessable_entity
      end 

    elsif service_category == "ShelterService"
      
      @service = Shelter.new(
                            name: params[:name],
                            specialty: params[:specialty],
                            contact_info_id: params[:contact_info_id],
                            )

      if @service.save 
         render json: {
                      name: @service.name, 
                      specialty: @service.specialty, 
                      contact_info_id: @service.contact_info_id,
                      email: @service.contact_info.email,
                      phone_number: @service.contact_info.phone_number,
                      address: @service.contact_info.address,
                      city: @service.contact_info.city,
                      state: @service.contact_info.state,
                      zip: @service.contact_info.zip,
                      prefered_contact_method: @service.contact_info.prefered_contact_method,
                    }
      else 
        render json: {errors: @service.errors.full_messages}, status: :unprocessable_entity
      end 
    end 
  end 

  def show 

    service_category = params[:category]

    if service_category.include?("law")
      @service = LawService.find(params[:id])
    elsif service_category.include?("mental")
      @service = MentalHealthService.find(params[:id])
    elsif service_category.include?("shelter")
      @service = Shelter.find(params[:id])
    end 

    render json: {
                  id: @service.id,
                  name: @service.name, 
                  specialty: @service.specialty, 
                  contact_info_id: @service.contact_info_id,
                  email: @service.contact_info.email,
                  phone_number: @service.contact_info.phone_number,
                  address: @service.contact_info.address,
                  city: @service.contact_info.city,
                  state: @service.contact_info.state,
                  zip: @service.contact_info.zip,
                  prefered_contact_method: @service.contact_info.prefered_contact_method,
                  }
  end

  def update 

    @service_category = params[:category]

    if @service_category.include?("law")
      @service = LawService.find(params[:id])
    elsif @service_category.include?("mental")
      @service = MentalHealthService.find(params[:id])
    elsif @service_category.include?("shelter")
      @service = Shelter.find(params[:id])
    end 

    @service.name = params[:name] || @service.name 
    @service.specialty = params[:specialty] || @service.specialty
    @service.contact_info.email = params[:email] || @service.contact_info.email
    @service.contact_info.phone_number = params[:phone_number] || @service.contact_info.phone_number
    @service.contact_info.address = params[:address] || @service.contact_info.address
    @service.contact_info.city = params[:city] || @service.contact_info.city
    @service.contact_info.state = params[:state] || @service.contact_info.state
    @service.contact_info.zip = params[:zip] || @service.contact_info.zip
    @service.contact_info.prefered_contact_method = params[:prefered_contact_method] || @service.contact_info.prefered_contact_method
    
    if @service.save
      render json: {
                  id: @service.id,
                  name: @service.name, 
                  specialty: @service.specialty, 
                  contact_info_id: @service.contact_info_id,
                  email: @service.contact_info.email,
                  phone_number: @service.contact_info.phone_number,
                  address: @service.contact_info.address,
                  city: @service.contact_info.city,
                  state: @service.contact_info.state,
                  zip: @service.contact_info.zip,
                  prefered_contact_method: @service.contact_info.prefered_contact_method,
                  }
    else   
      render json: {errors: @service.errors.full_messages}, status: :unprocessable_entity
    end 

  end 

  def destroy

    @service_category = params[:category]

    if @service_category.include?("law")
      service = LawService.find(params[:id])
    elsif @service_category.include?("mental")
      service = MentalHealthService.find(params[:id])
    elsif @service_category.include?("shelter")
      service = Shelter.find(params[:id])
    end 

    service.destroy
    render json: { message: "Successfully destroyed #{service.name}."}

  end 
  

end
