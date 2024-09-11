# frozen_string_literal: true

module RS
  module Link
    class Component < ViewComponent::Base
      attr_reader :text, :url, :color, :confirmation

      STYLES = {
        primary: 'text-primary-600 hover:text-primary-500',
        gray: 'text-gray-900 hover:text-gray-800'
      }.freeze

      def initialize(url:, text: nil, color: 'primary', method: nil, target: nil, confirmation: nil)
        super
        @text = text
        @url = url
        @method = method
        @target = target
        @html_class = STYLES[color.to_sym]
        @confirmation = confirmation
      end

      def data_attributes
        {
          'turbo-frame': @target,
          'turbo-action': @target.present? ? 'advance' : nil,
          'turbo-method': @method,
          'turbo-confirm': @confirmation
        }.compact
      end
    end
  end
end
