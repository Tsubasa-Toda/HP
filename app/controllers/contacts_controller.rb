class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path, notice: 'Thank you for your message!'
    else
      flash.now[:alert] = "error!"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :message)
  end
end
