# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/index', type: :view do
  before(:each) do
    user = create(:user)
    assign(:projects, [
             Project.create!(name: 'Name', description: 'MyText', user: user),
             Project.create!(name: 'Name', description: 'MyText', user: user)
           ])
  end

  it 'renders a list of projects' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    # assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
