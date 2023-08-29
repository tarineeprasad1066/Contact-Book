class SearchController < ApplicationController
  def index
    @results = search_for_contacts

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream:
            turbo_stream.update("contacts",
                                partial: "contacts/contacts",
                                locals: { contacts: @results })
        end
      end
  end

  private

  def search_for_contacts
    @results = if params[:query].blank?
                  Contact.all 
                else
                  Contact.search(params[:query], fields: %i[name phone email address], operator: "or", match: :text_middle)
                end
  end
end