# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/edit', type: :view do
  before(:each) do
    user = create(:user)
    @project = assign(:project, Project.create!(name: 'MyString', description: 'MyText', user: user))
  end

  it 'renders the edit project form' do
    render

    assert_select 'form[action=?][method=?]', project_path(@project), 'post' do
      assert_select 'input[name=?]', 'project[name]'

      assert_select 'textarea[name=?]', 'project[description]'

      assert_select 'input[name=?]', 'project[user_id]'
    end
  end
end
