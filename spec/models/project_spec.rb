require 'rails_helper'

RSpec.describe Project do

  describe "Initialization" do
    let(:project) {Project.new}
    let(:task) {Task.new}

    it "considers a Project with no tasks to be done" do
      expect(project).to be_done
    end

    it "knows that a project with an incomplete task is not done" do
      project.tasks << task
      expect(project).to_not be_done
    end
  end
end