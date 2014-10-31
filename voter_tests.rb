require 'minitest/autorun'
require './voter_classes'
require './voter_methods'
include VoterMethods

class VoterTests < Minitest::Test
	def test_create_politician
		bill = Politician.new("Bill Clinton", "Democrat")
		bill.name == "Bill Clinton"
	end

	def test_create_person
		robin = Person.new("Robin Williams", "Liberal")
		robin.politics == "Liberal"
	end

	def test_person_array
		Person.all
	end

	def test_pol_array
		Person.all
	end

	def test_list
		list()
	end

	def test_update
		#need to test in terminal, not with build
		bill = Politician.new("Bill Clinton", "Democrat")
		bill.update()
	end

	def test_campaign
		run_campaign()
	end

	def test_vote
		vote()
	end

	def test_tally
		tally()
	end
end