class MeetingLesson < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :lesson

  validates :meeting, presence: true
  validates :lesson, presence: true

  delegate :name, to: :lesson, prefix: true
  delegate :held_at, to: :meeting

  default_scope { order('order_number') }

  after_save :update_lesson_activity_times
  after_destroy :update_lesson_activity_times

  def update_lesson_activity_times
    lesson.update_activity_times
  end

  def course
    lesson.course
  end

  # shift_back and shift_forward also make a mess of Demeter.
  def shift_back
    previous_meeting = meeting
    course.meetings_after(meeting).each do |m|
      m.meeting_lessons.each do |ml|
        ml.meeting = previous_meeting
        ml.save!
      end
      previous_meeting = m
    end
  end

  def shift_forward
    previous_ids = meeting.meeting_lesson_ids.reject {|i| i==id}
    course.meetings_after(meeting).each do |m|
      current_ids = m.meeting_lesson_ids
      previous_ids.each do |i|
        MeetingLesson.find(i).update_attribute(:meeting, m)
      end
      previous_ids = current_ids
    end
    previous_ids.each {|i| MeetingLesson.find(i).destroy}
  end
end
