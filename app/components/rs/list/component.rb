# frozen_string_literal: true

module RS
  module List
    class Component < ViewComponent::Base
      renders_one :info, RS::List::Info::Component
      renders_one :search, RS::List::Search::Component
      renders_one :header, RS::List::Header::Component
      renders_many :rows, RS::List::Row::Component
      renders_one :pagination, RS::List::Pagination::Component
    end
  end
end
