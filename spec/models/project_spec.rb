# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'when creating' do
    it 'should fail if user is nil' do
      project = build(:project)
      expect(project.errors_on(:user)).to include('must exist')
    end
  end
end
