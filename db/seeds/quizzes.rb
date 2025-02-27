quizzes_files = Dir.glob('app/assets/data/quizzes/**/*.json')
users = User.sample(4)

quizzes_files.each do |quiz_file|
  quiz_json = JSON.parse File.read(quiz_file)

  Quiz.create(**quiz_json, user: users.sample)
end
