class ContactInfosController < ApplicationController

  def index

    @contact_infos = ContactInfo.all 

    render 'index.json.jbuilder'

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
    
    if @contact_info.save
      
    else
      render json: {errors: @contact_info.errors.full_messages}, status: :bad_request
    end

  end

  def destroy 

    contact_info = ContactInfo.find(params[:id])
    contact_info.destroy

  end 


end
