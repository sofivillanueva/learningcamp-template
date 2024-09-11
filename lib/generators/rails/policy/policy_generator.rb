# frozen_string_literal: true

module Rails
  class PolicyGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('templates', __dir__)

    def copy_policy_file
      template 'policy.erb', File.join('app/policies', class_path, "#{file_name}_policy.rb")
    end

    hook_for :test_framework
  end
end
