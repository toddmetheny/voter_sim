require './voter_methods'
include VoterMethods
require './voter_classes'


#Sample data.  
Person.sample_persons()
Person.rep_votes.push(Politician.new("Honest Abe", "Republican"))
Person.dem_votes.push(Politician.new("Harry Truman", "Democrat"))

#Run the program
start()
