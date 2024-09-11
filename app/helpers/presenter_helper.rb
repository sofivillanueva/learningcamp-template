# frozen_string_literal: true

module PresenterHelper
  def present(model, presenter_class = nil)
    klass = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model)
    yield(presenter) if block_given?
  end
end
