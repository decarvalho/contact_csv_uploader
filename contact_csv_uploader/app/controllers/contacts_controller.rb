class ContactsController < ApplicationController
  def index
    @contacts = Contact.where(user: current_user).page params[:page]
  end

  def new
    @contact = Contact.new
  end

  def import
    Contact.import(params[:file], current_user)

    redirect_to root_url
  end

  private

  def contact_params
    params.require(:contact).permit(:file)
  end
end
