ordering_quizzes_files = Dir[Rails.root.join('app/assets/data/ordering_quizzes/*')]

random_users = User.where(role: :admin).randomize.all

ordering_quizzes_files.each do |file|
  ordering_quizzes_data_array = JSON.parse File.read(file)
  ordering_quizzes_data_array.each do |ordering_quiz_data|
    ordering_quiz_data = ordering_quiz_data.with_indifferent_access

    ordering_quiz = OrderingQuiz.create ordering_quiz_data.except(:tags).merge(user: random_users.sample)

    tag_names = ordering_quiz_data[:tags]
    tag_maps = Tag.where(name: tag_names).map { |tag| [ { taggable: ordering_quiz, tag: } ] } if tag_names.present?

    TagMap.create(tag_maps)
  end
end
