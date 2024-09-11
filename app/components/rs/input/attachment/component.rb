# frozen_string_literal: true

module RS
  module Input
    module Attachment
      class Component < ViewComponent::Base
        attr_accessor :id, :name, :file_types, :size_mb

        def initialize(name: nil, id: nil, file_types: ['image/png', 'image/gif', 'image/jpg'], size_mb: 10)
          super
          @id = id || "#{SecureRandom.uuid}-#{Time.current.to_i}"
          @name = name
          @file_types = file_types
          @size_mb = size_mb
        end

        def supported_file_types_extension
          file_types.map { |type| type.split('/')[1]&.upcase }.join(', ')
        end

        def supported_file_types
          file_types.join(', ')
        end
      end
    end
  end
end
