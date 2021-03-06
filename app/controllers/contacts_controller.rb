class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @categories = Category.all
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = "Thank you for your message. We will contact you soon!"
      redirect_to recipes_path 
    else
      flash.now[:error] = "Cannot send message"
      render :contacts
    end
  end
end
