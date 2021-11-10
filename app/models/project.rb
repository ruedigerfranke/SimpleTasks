# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user

  has_many :tasks, dependent: :destroy

  validates :name, presence: true, allow_blank: false
end
