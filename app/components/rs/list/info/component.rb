# frozen_string_literal: true

module RS
  module List
    module Info
      class Component < ViewComponent::Base
        attr_reader :title, :description, :url, :text, :target

        def initialize(title:, description:, url:, text:, target:)
          super
          @title = title
          @description = description
          @url = url
          @text = text
          @target = target
        end
      end
    end
  end
end
