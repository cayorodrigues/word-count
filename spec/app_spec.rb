# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Word Count' do
  context 'GET /' do
    subject { get '/' }

    it 'returns status 200 OK' do
      expect(subject).to be_ok
    end

    it 'renders a form' do
      expect(subject.body).to have_tag(:form, action: '/count', method: 'post')
    end

    it 'renders an textarea' do
      expect(subject.body).to have_tag(:textarea, name: 'text')
    end

    it 'renders a submit button' do
      expect(subject.body).to have_tag(:button, type: 'submit')
    end
  end

  context 'POST /count' do
    subject { post '/count', text: }

    let(:text) { '' }

    context 'when text param is blank' do
      let(:text) { '' }

      it 'returns status 200 OK' do
        expect(subject).to be_ok
      end

      it 'renders an error message' do
        expect(subject.body).to have_tag(:div, text: 'Some input text is required')
      end
    end

    context 'when text param is present' do
      it 'returns status 200 OK' do
        expect(subject).to be_ok
      end

      context 'when text has only one word' do
        let(:text) { Faker::Lorem.sentence(word_count: 1) }

        it 'renders a count message' do
          expect(subject.body).to have_tag(:p, text: '1 Word')
        end
      end

      context 'when text has more than one words' do
        let(:text) { Faker::Lorem.sentence(word_count: 3) }

        it 'renders a pluralized count message' do
          expect(subject.body).to have_tag(:p, text: '3 Words')
        end
      end
    end
  end
end
