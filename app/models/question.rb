class Question < ActiveRecord::Base

  belongs_to :college_combination

  has_many :answer_options

  def self.get_questions(first_college, second_college)
    clj_com = CollegeCombination.where("(primary_college_id =? AND secondary_college_id =? ) OR
                              (primary_college_id =? AND secondary_college_id =?)", first_college.to_i,
                              second_college.to_i, second_college.to_i, first_college.to_i).first

    clj_com.questions
  end

end
