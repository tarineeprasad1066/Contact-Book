class ContactsController < ApplicationController

  before_action :find_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all
    
    # @albums = current_user.albums.paginate(page: params[:page], per_page: 4)
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    ash = contact_params;
    ash[:user_id] = current_user.id;
    @contact = Contact.new(ash);

    if @contact.save
      redirect_to contacts_path, notice: "Contact #{@contact.name} has been uploaded!"
    else
      render 'new'
    end
  end
  
  def show

  end

  def edit

  end
  
  def update
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "Contact #{@contact.name} has been sucessfully updated!"
    else
      render 'edit'
    end
  end
  
  def destroy
    @contact.destroy
    redirect_to contacts_path, notice: "Contact #{@contact.name} has been sucessfully deleted!"
  end
  
  private

  def find_contact
    @contact = current_user.contacts.find(params[:id])
  end
  
  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :address)
  end
end
