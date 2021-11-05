# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Statics', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end
end
