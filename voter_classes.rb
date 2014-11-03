class Voter
	attr_accessor :id, :name, :politics, :political_party, :stump_speech

	@@person_id = 0
	@@politician_id = 0

	@@persons = []
	@@pols = []

	#to collect votes
	@@dem_votes = []
	@@rep_votes = []

	#randomization of which speech we'll give
	@@stump_speech = []

	#party specific...for a primary
	@@all_republicans = []
	@@all_democrats = []

	#could use if there's more than one candidate
	@@dem_nominee = []
	@@rep_nominee = []

end

class Person < Voter
	attr_accessor :sample_persons

	def initialize(name, politics)
		@id = @@person_id
		@name = name
		@politics = politics

		@@person_id += 1
		@@persons << self
	end

	def self.all
		@@persons
	end

	#so I don't have to create everyone by hand each time
	def self.sample_persons
		jim_bob = Person.new("Jim-Bob", "Tea Party")
		eugene = Person.new("Eugene Debs", "Socialist")
		matt = Person.new("Matt Damon", "Liberal")
		shahana = Person.new("Shahana Bhattacharya", "Neutral")
		crowell = Person.new("Jason Crowell", "Conservative")
	end

	# def view_politics
	# end

	def self.dem_votes
		@@dem_votes
	end

	def self.rep_votes
		@@rep_votes 
	end

end

class Politician < Voter
	attr_accessor :campaign
	def initialize(name, political_party)
		@id = @@politician_id
		@name = name
		@political_party = political_party
		@@politician_id += 1
		@@pols << self
	end

	def self.all
		@@pols
	end

	def visit_every_voter
		@@pols.each do |pol|
			puts "Hello I'm #{pol.name}."
			puts stump_speech.sample(1)
				@@pols.each do |other_pols|
					unless pol.name == other_pols.name
					puts ""
					puts "#{other_pols.name}: Terrible speech. Awful human being. I'm voting for #{other_pols.name}."
					puts "Random observer (shouts): You are #{other_pols.name}."
					puts "#{other_pols.name}: Vote for #{other_pols.name}, then!"
				end

				@@persons.each do |person|
					puts ""
					puts "#{pol.name}: Hello very attractive and likeable voter. What's your name?"
					puts "#{person.name}: I'm #{person.name}."
					puts "#{pol.name}: Well, #{person.name}..."
					puts stump_speech.sample(1)
				end
			end
		end
	end

	def stump_speech
		@@stump_speech = ["Yes we (probably) can!", "Potentially, a moderately better tomorrow!", 
											"If you vote for anyone else, the world will end!", 
										"Vote for me unless you hate this geographic region!", 
										"Vote for me unless you hate freedom.", "My opponent may or may not be a Nazi.",
										"If you have a baby, I'd be very happy to kiss it.",
										"Hope you guys like WAR. I mean the band. Or sabermetrics. Not actual war."]
	end

	def campaign
		puts "A campaign has begun. Time to hustle people for personal glory."
		puts "In the name of public service, of course."
		puts "Commence stump speeches."
		puts ""

		visit_every_voter()

		puts ""
		puts "The time for campaigning is over."
		puts "Time to vote."
		puts "---------------------------------"
	end

	def self.primary
		Politician.all.each do |pol|
			if pol.political_party.downcase == "democrat"
				@@all_democrats.push(pol)
			else 
				@@all_republicans.push(pol)
			end
		end

		puts @@all_democrats
		puts @@all_republicans

		if @@all_democrats.count > 1
			puts "There are #{@@all_democrats.count}."
			puts "Looks like we'll need a democratic primary."
			@@dem_nominee = @@all_democrats.sample(1)
			@@dem_nominee.each do |nominee|
				puts "And the Democratic nominee is #{nominee.name}!"
			end
		else
			puts "No need for a primary, there's only #{@@all_democrats.count} Democrat."
			@@dem_nominee.push(@@all_democrats[0])
		end

		p @@dem_nominee

		if @@all_republicans.count > 1
			puts "There are #{@@all_republicans.count}."
			puts "Looks like we'll need a Republican primary."
			@@rep_nominee = @@all_republicans.sample(1)
			@@rep_nominee.each do |nominee|
				puts "And the Republican nominee is #{nominee.name}!"
			end
		else
			puts "No need for a primary, there's only #{@@all_republicans.count} Republican."
			@@rep_nominee.push(@@all_republicans[0])
		end

		p @@rep_nominee
	end

	def self.dem_nominee
		@@dem_nominee
	end

	def self.rep_nominee
		@@rep_nominee
	end

	def self.sample_politicians
		lincoln = Politician.new("Honest Abe", "Republican")
		truman = Politician.new("Harry Truman", "Democrat")
	end
end