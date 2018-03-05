class ContactInfosController < ApplicationController

  def index

    @contact_infos = ContactInfo.all 

    render 'index.json.jbuilder'

  end 

end
