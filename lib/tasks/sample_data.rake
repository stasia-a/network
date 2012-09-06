namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    make_users
    make_posts
    make_relationships
   end
end
    def make_users
      admin=User.create!(email: "example@example.org",
                 password: "foobar",
                 password_confirmation: "foobar")
      admin.toggle!(:admin)
      admin.create_profile()
      
      99.times do |n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      status = Faker::Lorem.sentence(6)
      email = "example-#{n+1}@example.org"
      password  = "password"
      user=User.create!(email: email,
                   password: password,
                   password_confirmation: password)
      user.create_profile(first_name: first_name, last_name: last_name, status: status)
      end
    end

    def make_relationships
      users=User.all
      user=users.first
      friends=users[2..50]
      friends.each { |f| user.friend!(f) }
      friends.each { |f| f.friend!(user) }
    end

    def make_posts
      senders=User.all(limit: 50)
      user=User.first
      content = Faker::Lorem.sentence(5)
      senders.each {|sender| user.post!(content,sender) }
    end
