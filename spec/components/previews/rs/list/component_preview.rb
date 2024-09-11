# frozen_string_literal: true

module RS
  module List
    class ComponentPreview < ViewComponent::Preview
      def standard
        render ::RS::List::Component.new do |component|
          component.with_info(title: 'Title', description: 'Description', url: '#', text: 'Text',
                              target: 'Target').render_in(component)
          component.with_header(column_names: %w[column1 column2 column3 column4 column5]).render_in(component)
          component.with_search(url: 'users_path').render_in(component)
          component.with_row(
            row_values: [
              { value: 'row 1', image: true },
              { value: 'row 2', label: 'success' },
              { value: 'row 3' },
              { value: 'row 4' },
              { value: 'row 5' }
            ],
            actions: [
              { name: 'edit', url: '#' },
              { name: 'remove', url: '#' }
            ]
          ).render_in(component)

          component.with_pagination(
            next_url: '#',
            previous_url: '#',
            to: 1,
            from: 2,
            count: 2,
            series_with_url: [{ item: 1, url: '#' }, { item: 2, url: '#' }],
            current_page: 2
          )
        end
      end
    end
  end
end
