require './voter_methods'
include VoterMethods
require './voter_classes'

#remaining issues/tasks: 
#1-print out the candidate specific results using the candidates name
#2-Build out to include a primary.

Person.sample_persons()
Person.rep_votes.push(Politician.new("Honest Abe", "Republican"))
Person.dem_votes.push(Politician.new("Harry Truman", "Democrat"))

start()





