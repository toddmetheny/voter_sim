require './voter_methods'
include VoterMethods
require './voter_classes'


Person.sample_persons()
Person.rep_votes.push(Politician.new("Honest Abe", "Republican"))
Person.dem_votes.push(Politician.new("Harry Truman", "Democrat"))

start()
