require './voter_methods'
include VoterMethods
require './voter_classes'

#remaining issues/tasks: 
#1-make the politicians vote (for themselves), what if more politicians?
#2-print out the candidate specific results using the candidates name
#3-Build out to include a primary.
#4-need to write tests. how to approach?
#5-politicians need to visit each other

Person.sample_persons()
Person.rep_votes.push(Politician.new("Honest Abe", "Republican"))
Person.dem_votes.push(Politician.new("Harry Truman", "Democrat"))

start()





