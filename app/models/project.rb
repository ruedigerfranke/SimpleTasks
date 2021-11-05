# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, allow_blank: false
end
