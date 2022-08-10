desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  # falta
  User.destroy_all

  user = User.new
  user.email = "alice@example.com"
  user.password = "password"
  user.save

  if user.errors.any?
    p user.errors.full_messages
  end

  p "#{User.count} usears are in the database."

  20.times do
    task = Task.new
    task.body = Faker::TvShows::GameOfThrones.quote
    task.status = ["not_yet_started","in_progress","completed"].sample
    task.user_id = user.id
    task.save
  end

  p "#{Task.count} usears are in the database."
end
