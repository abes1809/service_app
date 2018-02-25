class UsersController < ApplicationController

  def create
    user = User.new(
      name: params[:name],
      # params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      contact_info_id: params[:contact_info_id],
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
