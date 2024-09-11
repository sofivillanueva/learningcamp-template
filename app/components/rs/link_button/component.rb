# frozen_string_literal: true

module RS
  module LinkButton
    class Component < ViewComponent::Base
      attr_reader :text, :url, :color, :variant

      STYLES = {
        primary: 'bg-primary-600 text-neutral-100 hover:bg-primary-500'
      }.freeze

      VARIANTS = {
        soft: 'bg-primary-200 text-primary-600 hover:bg-primary-100',
        outline: 'border-[1px] hover:bg-neutral-100'
      }.freeze

      def initialize(text:, url:, color: :primary, variant: nil, target: nil)
        super
        @text = text
        @url = url
        @html_class = variant.nil? ? STYLES[color] : VARIANTS[variant]
        @target = target
      end

      def data_attributes
        {
          'turbo-frame': @target,
          'turbo-action': @target.present? ? 'advance' : nil,
          'turbo-method': @method
        }.compact
      end
    end
  end
end
