['A', 'B', 'C', 'D'].each do |clj|
  College.create(college_name: clj)
end

CollegeCombination.all.each do |combination|
  for i in 1..4
    qn = combination.questions.create(question_name: "This Questions No #{i}")
    for j in 1..4
      qn.answer_options.create(option: "Option For Question #{i} and answer #{j}", is_correct: ((j%i) == 0))
    end
  end
end