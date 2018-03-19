class UsersController < ApplicationController

  # def create
  #   @contact_info = ContactInfo.new(
  #                                    email: params[:email],
  #                                    phone_number: params[:phone_number],
  #                                    address: params[:address],
  #                                    state: params[:state],
  #                                    city: params[:city],
  #                                    zip: params[:zip],
  #                                    prefered_contact_method: params[:prefered_contact_method],
  #                                  )
  #    if @contact_info.save
  #    else 
  #      render json: {errors: @contact_info.errors.full_messages}, status: :unprocessable_entity
  #      exit 
  #    end

  #   user = User.new(
  #                   name: params[:name],
  #                   email: params[:email],
  #                   password: params[:password],
  #                   password_confirmation: params[:password_confirmation],
  #                   contact_info_id: @contact_info.id,
  #                   gender: params[:gender],
  #                   sex: params[:sex],
  #                   homeless_date: params[:homeless_date],
  #                   domestic_violence_survivor: params[:domestic_violence_victim],
  #                   annual_income: params[:annual_income],
  #                   household_size: params[:household_size],
  #                   age: params[:age]
  #                 )

  #   if user.save
  #   else
  #     render json: {errors: user.errors.full_messages}, status: :bad_request
  #     exit 
  #   end


  # end

end
