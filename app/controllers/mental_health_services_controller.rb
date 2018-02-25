class MentalHealthServicesController < ApplicationController

  def show 

    @mental_health_service = MentalHealthService.find(params[:id])

    render 'show.json.jbuilder'
    
  end

  def create 

     @contact_info = ContactInfo.new(
                                      email: params[:email],
                                      address: params[:address],
                                      city: params[:city],
                                      state: params[:state],
                                      zip: params[:zip]
                                    )
      if @contact_info.save
      else 
        render json: {errors: @contact_info.errors.full_messages}, status: :unprocessable_entity
        exit 
      end


      @mental_health_service = MentalHealthService.new(
                                name: params[:name],
                                specialty: params[:specialty],
                                contact_info_id: params[:contact_info_id],
                                contact_info_id: @contact_info.id
                                )

      if @mental_health_service.save 

         render 'show.json.jbuilder'
      else 
        render json: {errors: @mental_health_service.errors.full_messages}, status: :unprocessable_entity
      end
  end 

  def update 

    @mental_health_service = MentalHealthService.find(params[:id])

    @mental_health_service.name = params[:name] || @mental_health_service.name 
    @mental_health_service.specialty = params[:specialty] || @mental_health_service.specialty
    @mental_health_service.contact_info.email = params[:email] || @mental_health_service.contact_info.email
    @mental_health_service.contact_info.phone_number = params[:phone_number] || @mental_health_service.contact_info.phone_number
    @mental_health_service.contact_info.address = params[:address] || @mental_health_service.contact_info.address
    @mental_health_service.contact_info.city = params[:city] || @mental_health_service.contact_info.city
    @mental_health_service.contact_info.state = params[:state] || @mental_health_service.contact_info.state
    @mental_health_service.contact_info.zip = params[:zip] || @mental_health_service.contact_info.zip
    @mental_health_service.contact_info.prefered_contact_method = params[:prefered_contact_method] || @mental_health_service.contact_info.prefered_contact_method
    
    if @mental_health_service.save
      render 'show.json.jbuilder'
    else   
      render json: {errors: @mental_health_service.errors.full_messages}, status: :unprocessable_entity
    end 

  end 

  def destroy
    mental_health_service = MentalHealthService.find(params[:id])
    contact_info_id = mental_health_service.contact_info_id
    contact_info = ContactInfo.find(contact_info_id)

    contact_info.delete
    mental_health_service.delete

    render json: { message: "Successfully destroyed #{mental_health_service.name}."}
  end 

end
