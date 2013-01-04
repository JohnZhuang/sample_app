namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "John Zhuang",
                         email: "melon42@gmail.com",
                         password: "columbia",
                         password_confirmation: "columbia")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@barracudaz.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

      @material = ["Gold","Pearl","Silver","Gun Metal"]
      @variety = ["Single-Strand", "Double-Strand", "Multi-Layer", "Dangle"]
      @types = ["Necklace", "Bracelet", "Earrings", "Studs", "Choker"]
      @description = ["Can come in many different sizes.", "Hand-crafted by the designer.", "The newest design in the collection.", "No description available.", "See picture for more details."]

      

    users = User.all
    1.times do
 
      users.each { |user| user.projects.create!(
        #:title => Faker::Lorem.sentence(5)
        :title => @material.sample.to_s + ' ' + @variety.sample.to_s + ' ' + @types.sample.to_s,
        :description => @description.sample.to_s,
        :location => Faker::Address.us_state(),
        :start => (rand(30-1)+30).days.ago.to_date,
        :end => (rand(30-1)).days.ago.to_date,
        :goal => (rand(50000-1)+100000),
        :pledged => (rand(100000-1)),
        :backers => (rand(1000-1))
        ) }
    end
  end
end
