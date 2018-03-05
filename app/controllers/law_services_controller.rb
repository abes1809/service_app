class LawServicesController < ApplicationController

  def create
    @contact_info = ContactInfo.new(
                                    email: params[:email],
                                    phone_number: params[:phone_number],
                                    address: params[:address],
                                    state: params[:state],
                                    city: params[:city],
                                    zip: params[:zip],
                                    prefered_contact_method: params[:prefered_contact_method],
                                    website: params[:website]
                                   )
     if @contact_info.save
     else 
       render json: {errors: @contact_info.errors.full_messages}, status: :unprocessable_entity
       exit 
     end

      @law_service = LawService.new(
                                name: params[:name],
                                specialty: params[:specialty],
                                contact_info_id: @contact_info.id
                                )

      if @law_service.save 

         render 'show.json.jbuilder'
      else 
        render json: {errors: @law_service.errors.full_messages}, status: :unprocessable_entity
      end
  end 

  def show 

    @law_service = LawService.find(params[:id])

    render 'show.json.jbuilder'

  end

  def update 

    @law_service = LawService.find(params[:id])

    @law_service.name = params[:name] || @law_service.name 
    @law_service.specialty = params[:specialty] || @law_service.specialty
    @law_service.contact_info.email = params[:email] || @law_service.contact_info.email
    @law_service.contact_info.phone_number = params[:phone_number] || @law_service.contact_info.phone_number
    @law_service.contact_info.address = params[:address] || @law_service.contact_info.address
    @law_service.contact_info.city = params[:city] || @law_service.contact_info.city
    @law_service.contact_info.state = params[:state] || @law_service.contact_info.state
    @law_service.contact_info.zip = params[:zip] || @law_service.contact_info.zip
    @law_service.contact_info.prefered_contact_method = params[:prefered_contact_method] || @law_service.contact_info.prefered_contact_method
    
    if @law_service.save
      render 'show.json.jbuilder'
    else   
      render json: {errors: @law_service.errors.full_messages}, status: :unprocessable_entity
    end 

  end 

  def destroy
    law_service = LawService.find(params[:id])
    contact_info_id = law_service.contact_info_id
    contact_info = ContactInfo.find(contact_info_id)

    contact_info.delete
    law_service.delete

    render json: { message: "Successfully destroyed #{law_service.name}."}
  end 

end

