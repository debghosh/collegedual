class College < ActiveRecord::Base


  after_create :add_college_combination

  def add_college_combination
    remaining_colleges = College.where('id != ?', self.id)

    unless  remaining_colleges.blank?
      remaining_colleges.each do |secondary_college|
        CollegeCombination.create(primary_college_id: self.id, secondary_college_id: secondary_college.id)
      end
    end
  end

end
