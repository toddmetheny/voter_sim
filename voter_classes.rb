class Voter
	attr_accessor :id, :name, :politics, :political_party

	@@person_id = 0
	@@politician_id = 0

	@@persons = []
	@@pols = []

	#to collect votes
	@@dem_votes = []
	@@rep_votes = []

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

	def campaign
		puts "A campaign has begun. Time to hustle people for personal glory."
		puts "In the name of public service, of course."
		puts "Commence stump speeches."
		puts ""
		stump_speech = ["Yes we (probably) can!", "Potentially, a moderately better tomorrow!", 
											"If you vote for anyone else, the world will end!", 
										"Vote for me unless you hate this geographic region!", 
										"Vote for me unless you hate freedom.", "My opponent may or may not be a Nazi."]
		@@persons.each do
			puts stump_speech.sample(1)
		end
	end

	def self.sample_politicians
		lincoln = Politician.new("Honest Abe", "Republican")
		truman = Politician.new("Harry Truman", "Democrat")
	end
end