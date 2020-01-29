# require 'destinations'

class Seed

  def self.begin

    @seed = Seed.new
    @seed.generate_destinations
  end

  def generate_destinations
    20.times do |i|
      destination = Destination.create!(
        country: Faker::Address.country,
        city: Faker::Address.city
      )
      5.times do |i|
        author = Faker::Name.middle_name
        review = Review.create!(destination_id: destination.id, author: author, content: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10))
      puts "Destination #{i}: Country is #{destination.country} and city is '#{destination.city}'."
      p "created #{Review.count} Reviews"
    end
  end
end
end
Seed.begin
