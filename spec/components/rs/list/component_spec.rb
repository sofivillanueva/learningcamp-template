# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RS::List::Component, type: :component do
  subject do
    render_inline(described_class.new) do |component|
      component.with_info(url:, text: action_text, target: action_target, title: action_title,
                          description: action_description)
      component.with_search(url:)
      component.with_header(column_names:)
      component.with_row(row_values:, actions:)
    end
  end

  let(:url) { '#' }
  let(:action_text) { 'New User' }
  let(:action_target) { 'user' }
  let(:action_title) { 'User' }
  let(:action_description) { 'Add a new user to the list' }
  let(:column_names) { %w[column1 column2 column3] }
  let(:row_values) { [{ value: 'row 1', label: 'success' }, { value: 'row 2' }, { value: 'row 3', label: 'error' }] }
  let(:actions) { [{ name: 'edit', url: '#' }, { name: 'remove', url: '#' }] }

  describe 'rendering' do
    it 'renders a list' do
      expect(subject).to have_text(action_text)
      expect(subject).to have_text(action_title)
      expect(subject).to have_text(action_description)
      expect(subject).to have_text(column_names.join(' '))
      expect(subject).to have_text('row 1')
      expect(subject).to have_text('row 2')
      expect(subject).to have_text('row 3')
      expect(subject).to have_text('Edit')
      expect(subject).to have_text('Remove')
      expect(subject).to have_css("svg[id*='search_icon']")
    end

    it 'renders the search component' do
      expect(subject).to have_text('Search')
    end

    context 'when receive image values' do
      context 'when receive image == true' do
        context 'when no receive image_src' do
          let(:row_values) do
            [{ value: 'row 1', image: true }, { value: 'row 2' }, { value: 'row 3', label: 'error' }]
          end

          it 'renders the default image' do
            expect(subject).to have_css("svg[id*='recipe_icon']")
          end
        end

        context "when no receive image_src = ''" do
          let(:row_values) do
            [{ value: 'row 1', image: true, image_src: '' }, { value: 'row 2' }, { value: 'row 3', label: 'error' }]
          end

          it 'renders the default image' do
            expect(subject).to have_css("svg[id*='recipe_icon']")
          end
        end

        context "when receive image_src = 'some_image_source.jpg'" do
          let(:row_values) do
            [{ value: 'row 1', image: true, image_src: 'some_image_source.jpg' }, { value: 'row 2' },
             { value: 'row 3', label: 'error' }]
          end

          it 'renders the default image' do
            expect(subject).to have_css("img[src*='some_image_source.jpg']")
          end
        end
      end

      context 'when receive image == false' do
        let(:row_values) do
          [{ value: 'row 1', image: false, image_src: 'some_image_source.jpg' }, { value: 'row 2' },
           { value: 'row 3', label: 'error' }]
        end

        it 'renders the default image' do
          expect(subject).to have_no_css("img[src*='some_image_source.jpg']")
          expect(subject).to have_no_css("svg[id*='recipe_icon']")
        end
      end
    end

    context 'when there are only Edit action' do
      let(:actions) { [{ name: 'edit', url: '#' }] }

      it 'renders the list with Edit action only' do
        expect(subject).to have_text('Edit')
        expect(subject).to have_no_text('Remove')
      end
    end

    context 'when there are only Remove action' do
      let(:actions) { [{ name: 'remove', url: '#' }] }

      it 'renders the list with Remove action only' do
        expect(subject).to have_text('Remove')
        expect(subject).to have_no_text('Edit')
      end
    end
  end
end
