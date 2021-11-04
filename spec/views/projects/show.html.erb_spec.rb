# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/show', type: :view do
  before(:each) do
    user = create(:user)
    @project = assign(:project, Project.create!(name: 'Name', description: 'MyText', user: user))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
