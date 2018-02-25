class UsersController < ApplicationController

  def create
    @contact_info = ContactInfo.new(
                                     email: params[:email],
                                     address: params[:address],
                                     city: params[:city],
                                     state: params[:state],
                                     zip: params[:zip]
                                   )
     if contact_info.save
     else 
     render json: {errors: @contact_info.errors.full_messages}, status: :unprocessable_entity

    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      contact_info_id: @contact_info.id,
      gender: params[:gender],
      sex: params[:sex],
      homeless_date: params[:homeless_date],
      domestic_violence_survivor: params[:domestic_violence_victim],
      annual_income: params[:annual_income]
    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

end
