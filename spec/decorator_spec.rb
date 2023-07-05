require 'rspec'
require_relative '../person'
require_relative '../decorator'

RSpec.describe Decorator do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'delegates the correct_name method to the nameable object' do
      allow(nameable).to receive(:correct_name).and_return('John Doe')
      expect(subject.correct_name).to eq('John Doe')
    end
  end
end

RSpec.describe CapitalizeDecorator do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the name returned by the nameable object' do
      allow(nameable).to receive(:correct_name).and_return('john doe')
      expect(subject.correct_name).to eq('John doe')
    end
  end
end

RSpec.describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  subject { described_class.new(nameable) }

  describe '#correct_name' do
    context 'when the name is longer than 10 characters' do
      it 'trims the name to the first 10 characters' do
        allow(nameable).to receive(:correct_name).and_return('Johnathan Doe')
        expect(subject.correct_name).to eq('Johnathan ')
      end
    end

    context 'when the name is not longer than 10 characters' do
      it 'returns the name as is' do
        allow(nameable).to receive(:correct_name).and_return('John Doe')
        expect(subject.correct_name).to eq('John Doe')
      end
    end
  end
end
