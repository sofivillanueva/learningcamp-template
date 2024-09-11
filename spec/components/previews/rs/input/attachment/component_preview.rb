# frozen_string_literal: true

module RS
  module Input
    module Attachment
      class ComponentPreview < ViewComponent::Preview
        # @param name text
        def standard(name: 'upload')
          render ::RS::Input::Attachment::Component.new(name:)
        end
      end
    end
  end
end
