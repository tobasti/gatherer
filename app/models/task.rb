class Task < ActiveRecord::Base

  belongs_to :project

  def mark_completed(date = nil)
    self.completed_at = (date || Time.current)
  end

  def complete?
    completed_at.present?
  end

  def part_of_velocity?
    return false unless complete?
    completed_at > 3.weeks.ago
  end

  def points_towards_velocity
    part_of_velocity? ? size : 0
  end
end
