class SheltersController < ApplicationController

  def show 

    @shelter = Shelter.find(params[:id])

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
                                     website: params[:website]
                                    )
      if @contact_info.save
      else 
        render json: {errors: @contact_info.errors.full_messages}, status: :unprocessable_entity
        exit 
      end


      @shelter = Shelter.new(
                                name: params[:name],
                                specialty: params[:specialty],
                                contact_info_id: @contact_info.id
                                )

      if @shelter.save 

         render 'show.json.jbuilder'
      else 
        render json: {errors: @shelter.errors.full_messages}, status: :unprocessable_entity
      end
  end 

  def update 

    @shelter = Shelter.find(params[:id])

    @shelter.name = params[:name] || @shelter.name 
    @shelter.specialty = params[:specialty] || @shelter.specialty
    @shelter.contact_info.email = params[:email] || @shelter.contact_info.email
    @shelter.contact_info.phone_number = params[:phone_number] || @shelter.contact_info.phone_number
    @shelter.contact_info.address = params[:address] || @shelter.contact_info.address
    @shelter.contact_info.city = params[:city] || @shelter.contact_info.city
    @shelter.contact_info.state = params[:state] || @shelter.contact_info.state
    @shelter.contact_info.zip = params[:zip] || @shelter.contact_info.zip
    @shelter.contact_info.prefered_contact_method = params[:prefered_contact_method] || @shelter.contact_info.prefered_contact_method
    
    if @shelter.save
      render 'show.json.jbuilder'
    else   
      render json: {errors: @shelter.errors.full_messages}, status: :unprocessable_entity
    end 

  end 

  def destroy
    shelter = Shelter.find(params[:id])
    contact_info_id = shelter.contact_info_id
    contact_info = ContactInfo.find(contact_info_id)

    contact_info.delete
    shelter.delete

    render json: { message: "Successfully destroyed #{shelter.name}."}
  end 

end
