# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'static/home.html.erb', type: :view do
  it 'renders correct headline in <h1>' do
    render
    assert_select 'h1', text: 'Welcome to SimpleTasks'.to_s, count: 1
  end
end
