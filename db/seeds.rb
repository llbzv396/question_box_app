User.create(name: "Demo User",
            email: "demo@railstutorial.org",
            password: "demouser",
            )

4.times do |n|
  name  = Faker::JapaneseMedia::SwordArtOnline.game_name
  email = "example#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password: password
            )
end

users = User.all
5.times do |n|
  question = Faker::Lorem.sentence(5)
  answer   = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(question: question, answer: answer) }
end

users.each do |user|
  10.times do
    i = (1..25).to_a
    i = i.shuffle!.first
    Favorite.create(user_id: user.id,
                    micropost_id: i
                  )
  end
end
