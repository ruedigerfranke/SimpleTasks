# frozen_string_literal: true

class Task < ApplicationRecord
  acts_as_list scope: :project

  belongs_to :user
  belongs_to :project
end
