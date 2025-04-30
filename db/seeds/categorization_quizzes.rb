categorization_quizzes_files = Dir[Rails.root.join('app/assets/data/categorization_quizzes/*')]

random_users = User.where(role: :admin).randomize.all

categorization_quizzes_files.each do |file|
  categorization_quiz_data_array = JSON.parse File.read(file)
  categorization_quiz_data_array.each do |categorization_quiz_data|
    categorization_quiz_data = categorization_quiz_data.with_indifferent_access

    category = CategorizationQuiz.create categorization_quiz_data.except(:tags).merge(user: random_users.sample)
    tag_maps = Tag.where(name: categorization_quiz_data[:tags]).map { |tag| [{ taggable: category, tag: }] }

    TagMap.create(tag_maps)
  end
end
