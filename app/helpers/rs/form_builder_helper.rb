# frozen_string_literal: true

module RS
  module FormBuilderHelper
    def rs_form_with(model: nil, scope: nil, url: nil, format: nil, **options, &)
      options[:builder] = RS::FormBuilder
      form_with(model:, scope:, url:, format:, **options, &)
    end
  end
end
