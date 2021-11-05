# frozen_string_literal: true

class StaticController < ApplicationController
  def home
    redirect_to(projects_path) if current_user.present?
  end
end
