# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SimpleTasks
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.action_view.field_error_proc = proc { |html_tag, instance|
      errors = Array(instance.error_message).join(', ')
      # byebug
      case html_tag
      when /^<label/
        if html_tag =~ /^<label(?:\s+.*)*(\s+alt="(?:checkbox|hidden)")(?:\s+.*)*\s*/
          %(#{html_tag}<label class="label"><span class="label-text-alt">&nbsp;#{errors}</span></label>).html_safe
        else
          html_tag.to_s.html_safe
        end
      when %r{(<input(?:\s+.*)*(\s+type="(?:checkbox|hidden)")(?:\s+.*)*\s*/>)}
        html_tag.to_s.html_safe
      else
        html_tag = html_tag.sub('"input ', '"input input-error ')
        %(#{html_tag}<label class="label label-text-alt"><span class="text-red-400">&nbsp;#{errors}</span></label>).html_safe # rubocop:disable Layout/LineLength
      end
    }
  end
end
