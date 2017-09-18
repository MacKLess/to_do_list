require('spec_helper')

describe(List) do
  describe('.all') do
    it('starts off with no lists') do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#name') do
    it("tells you its name") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list.name()).to(eq("Epicodus stuff"))
    end
  end

  describe('#id') do
    it("sets its ID when you save it") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it("lets you save lists to the database") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      list1 = List.new({:name => "Epicodus stuff", :id => nil})
      list2 = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list1).to(eq(list2))
    end
  end

  describe('#tasks') do
    it "returns all tasks saved to the list, in order of due date" do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      task1 = Task.new({:description => "learn SQL", :list_id => list.id, :due_date => '2017-10-01'})
      task1.save
      task2 = Task.new({:description => "learn Ruby", :list_id => list.id, :due_date => '2017-09-20'})
      task2.save
      task3 = Task.new({:description => "learn Rails", :list_id => list.id, :due_date => '2017-12-01'})
      task3.save
      expect(list.tasks).to(eq([task2, task1, task3]))
    end
  end

  describe(".find") do
    it "returns a list by its id" do
      test_list = List.new({:name => "Epicodus Stuff", :id => nil})
      test_list.save
      test_list2 = List.new({:name => "Home Stuff", :id => nil})
      test_list2.save
      expect(List.find(test_list2.id)).to(eq(test_list2))
    end
  end
end
