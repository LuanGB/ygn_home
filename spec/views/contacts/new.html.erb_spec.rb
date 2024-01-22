# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'contacts/new' do
  before do
    assign(:contact, Contact.new(email: 'MyString', name: 'MyString', message: 'MyString'))
  end

  it 'renders new contact form' do
    render

    assert_select 'form[action=?][method=?]', contacts_path, 'post' do
      assert_select 'input[name=?]', 'contact[email]'

      assert_select 'input[name=?]', 'contact[name]'

      assert_select 'input[name=?]', 'contact[message]'
    end
  end
end
