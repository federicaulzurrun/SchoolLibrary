require 'rspec'
require_relative '../student'
require_relative '../classroom'

RSpec.describe Classroom do
  let(:classroom_label) { 'Mathematics' }
  let(:classroom) { described_class.new(classroom_label) }
  let(:student) { Student.new('John Doe') }

  describe '#initialize' do
    it 'sets the classroom label' do
      expect(classroom.label).to eq(classroom_label)
    end

    it 'initializes an empty students array' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the students array' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'sets the classroom for the added student' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
