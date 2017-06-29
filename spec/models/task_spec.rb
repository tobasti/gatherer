require 'rails_helper'

RSpec.describe Task do

  it "can distinguish a completed task" do
    task = Task.new
    expect(task).to_not be_complete
    task.mark_completed
    expect(task).to be_complete
  end

  describe "velocity" do
    let(:task) { Task.new(size: 3) }

    it "does not count an incomplete task towards velocity" do
      expect(task).to_not be_part_of_velocity
      expect(task.points_towards_velocity).to eq(0)
    end

    it "does not count a long-ago completed task towards velocity" do
      task.mark_completed(6.months.ago)
      expect(task).to_not be_part_of_velocity
      expect(task.points_towards_velocity).to eq(0)
    end

    it "counts a recently completed task towards velocity" do
      task.mark_completed(1.day.ago)
      expect(task).to be_part_of_velocity
      expect(task.points_towards_velocity).to eq(3)
    end
  end
end
