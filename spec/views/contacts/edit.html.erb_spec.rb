# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'contacts/edit' do
  let(:contact) do
    Contact.create!(email: 'MyString', name: 'MyString', message: 'MyString')
  end

  before do
    assign(:contact, contact)
  end

  it 'renders the edit contact form' do
    render

    assert_select 'form[action=?][method=?]', contact_path(contact), 'post' do
      assert_select 'input[name=?]', 'contact[email]'

      assert_select 'input[name=?]', 'contact[name]'

      assert_select 'input[name=?]', 'contact[message]'
    end
  end
end
