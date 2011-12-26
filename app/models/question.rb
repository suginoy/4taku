class Question < ActiveRecord::Base
  before_save :set_next_number
  after_destroy :compact
  belongs_to :course, :counter_cache => true
  has_many :scores
  has_many :users, :through => :scores

 #validates :number, :title, :description, :choice1, :choice2, :choice3, :choice4, :explanation,
  validates          :title, :description, :choice1, :choice2, :choice3, :choice4, :explanation,
    :presence => true
  validates :answer, :inclusion => { :in => [1, 2, 3, 4] }

  default_scope order("number")

  def next
    unless self.number == self.course.questions.length
     Question.find_by_course_id_and_number(self.course_id, self.number + 1)
    end
  end

  def compact
    Question.where(:course_id => self.course_id).each do |question|
      if question.number > self.number
        question.update_atribute(:number, self.number - 1)
      end
    end
  end

  private
    def set_next_number # TODO メソッド名変更
      self.number ||= self.course.questions_count + 1
    end
end
