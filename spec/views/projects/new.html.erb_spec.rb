# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/new', type: :view do
  before(:each) do
    user = create(:user)
    assign(:project, Project.new(name: 'MyString', description: 'MyText', user: user))
  end

  it 'renders new project form' do
    render

    assert_select 'form[action=?][method=?]', projects_path, 'post' do
      assert_select 'input[name=?]', 'project[name]'

      assert_select 'textarea[name=?]', 'project[description]'

      assert_select 'input[name=?]', 'project[user_id]'
    end
  end
end
