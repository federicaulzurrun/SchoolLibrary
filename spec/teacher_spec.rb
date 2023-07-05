require_relative '../teacher'

describe Teacher do
  context "When creating a Teacger" do
    it "should contain the given age for the teacher" do
      teacher = Teacher.new(44, 'Physics')
      expect(teacher.age).to eq(44)
    end

    it "should contain the given specialization" do
      teacher = Teacher.new(44, 'Physics')
      expect(teacher.specialization).to eq('Physics')
    end

    it "should contain the given name" do
      teacher = Teacher.new(44, 'Physics', 'Stela Altruzh')
      expect(teacher.name).to eq('Stela Altruzh')
    end

    it "should have parent permission by default" do
      teacher = Teacher.new(44, 'Physics', 'Stela Altruzh')
      expect(teacher.can_use_services?).to be true
    end


  end
end