# frozen_string_literal: true

module UserHelper
  def series_with_url(pagy)
    series_with_url = []

    pagy.series.each do |item|
      url = pagy_url_for(pagy, item)
      series_with_url << { item:, url: }
    end

    series_with_url
  end
end
