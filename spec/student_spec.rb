require_relative '../student'
require_relative '../classroom'

describe Student do
  context 'When creating a student' do
    it 'should create a student with the correct name and age' do
      student = Student.new(17, 'Jamil Kretz')
      expect(student.age).to eq(17)
      expect(student.name).to eq('Jamil Kretz')
    end

    it 'should have parent permission by default' do
      student = Student.new(14, 'Janice Chapmant')
      expect(student.can_use_services?).to be true
    end
  end

  context 'When assigning a classroom to a student' do
    it "should update the student's classroom" do
      student = Student.new(21, 'Elliot Ned')
      classroom = Classroom.new('Science')

      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
    end

    it "should add the student to the classroom's students list" do
      student = Student.new(19, 'Beth Lizz')
      classroom = Classroom.new('Math')

      student.classroom = classroom
      expect(classroom.students).to include(student)
    end
  end
end
