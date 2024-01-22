# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'contacts/show' do
  before do
    assign(:contact, Contact.create!(email: 'Email', name: 'Name', message: 'Message'))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Message/)
  end
end
