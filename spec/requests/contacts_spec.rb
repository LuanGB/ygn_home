# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/contacts' do
  # This should return the minimal set of attributes required to create a valid
  # Contact. As you add validations to Contact, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Contact' do
        expect do
          post api_v1_contacts_url, params: { contact: valid_attributes }
        end.to change(Contact, :count).by(1)
      end

      it 'redirects to the created contact' do
        post api_v1_contacts_url, params: { contact: valid_attributes }
        expect(response).to redirect_to(contact_url(Contact.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Contact' do
        expect do
          post api_v1_contacts_url, params: { contact: invalid_attributes }
        end.not_to change(Contact, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post api_v1_contacts_url, params: { contact: invalid_attributes }
        expect(response.has_http_status?(:unprocessable_entity)).to be(true)
      end
    end
  end
end
