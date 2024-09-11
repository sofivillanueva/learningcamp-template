# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RS::Input::Password::Component, type: :component do
  subject do
    render_inline(described_class.new(**args))
  end

  include_examples 'input component', 'password'
end
