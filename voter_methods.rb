module VoterMethods
	def start
		process = 0
		until process == 1
		puts "What would you like to do? Create, List, Update, or Vote."
		answer = gets.chomp
		  case answer.downcase
			when 'create'
				create()
			when 'list'
				list()
			when 'update'
				update()
			when 'vote'
				vote()
				process += 1
			else
				puts "You didn't enter Create, List, Update or Vote."
			end
		end
	end

	def create
		puts "What would you like to create? Politician or Person."
		create_answer = gets.chomp
		if create_answer.downcase == 'politician'
			puts "Name?"
			name = gets.chomp.capitalize
			puts "Party? Democrat or Republican."
			political_party = gets.chomp.capitalize
			
			charlie = Politician.new(name, political_party)	
		elsif create_answer.downcase == 'person'
			puts "Name?"
			name = gets.chomp.capitalize
			puts "Politics? Liberal, Conservative, Tea Party, Socialist or Neutral"
			politics = gets.chomp.capitalize
			yoda = Person.new(name, politics)
		else
			puts "You didn't enter 'Politician' or 'Person.'"
		end
	end

	def list
		puts ""
		puts "List of all voters and politicians:"
		puts ""
		Person.all.each do |person|
			puts "Voter, #{person.name}, #{person.politics}"
		end

		Politician.all.each do |pol|
			puts "Politician, #{pol.name}, #{pol.political_party}"
		end
		puts ""
		puts "-------------------------------------"
	end
			
	def update
		puts "What is your name?"
		old_name = gets.chomp.capitalize
		puts "What would you like to update? Enter Name, Party, or Politics"
		update_this = gets.chomp.capitalize
		if update_this ==  "Name"
			puts "What is the new name?"
			new_name = gets.chomp.capitalize

			Person.all.each do |person|
				if old_name == person.name
					person.name = new_name
				end
			end

			Politician.all.each do |pol|
				if old_name == pol.name
					pol.name = new_name
				end
			end
		elsif update_this == "Politics"
			puts "What are your new politics? Liberal, Conservative, Tea Party, Socialist or Neutral"
			new_politics = gets.chomp
			Person.all.each do |person|
				if old_name == person.name
					person.politics = new_politics
				end
			end

		elsif update_this == "Party"
			puts "What is your new party?"
			new_party = gets.chomp
			Politician.all.each do |pol|
				if old_name == pol.name
					pol.political_party = new_party
				end
			end 	 
		else
			puts "You didn't enter Name, Political Party, or Politics."
		end
	end

	def report_results
		puts "The results are in:"
		puts ""
		puts "#{Person.rep_votes.count} people voted Republican."
		puts ""
		puts "#{Person.dem_votes.count} people voted Democrat."
		puts ""
	end

	def tally
		report_results()

		if Person.rep_votes.count == Person.dem_votes.count
			puts "Ties are like kissing your sister."
			puts ""
		elsif Person.rep_votes.count > Person.dem_votes.count
			Politician.rep_nominee.each do |politician|
			# 	if politician.political_party.downcase == "republican"
					puts "Republican #{politician.name} is the victor."
					puts ""
				#end
			end
		else
			 Politician.dem_nominee.each do |politician|
			# 	if politician.political_party.downcase == "democrat"
					puts "Democrat #{politician.name} is the victor."
					puts ""
				#end
			end
		end
		puts "Thanks for playing."
	end

	def run_campaign
		Politician.all.each do |pol|
			pol.campaign()
		end
	end


	def changed_mind(boolean, name, politics)
		if boolean == false
			puts "I'm #{name}, I'd describe my politics as #{politics}. Predictably, I didn't change my mind."
		else
			puts "I'm #{name}, I'd describe my politics as #{politics}. Shockingly, I changed my mind."
		end
	end

	def probability(num)
		(1 + rand(100)) > num
	end

	def vote
		Politician.primary()
		run_campaign()
		puts "Let's poll some voters:"
		(Person.all).each do |peep|
			puts ""
			case
				when peep.politics.downcase == "tea party"
					if probability(10)
						changed_mind(false, peep.name, peep.politics)
						Person.rep_votes.push(peep)
					else
						changed_mind(true, peep.name, peep.politics)
						Person.dem_votes.push(peep)
					end

				when peep.politics.downcase == "conservative"
					if probability(25)
						changed_mind(false, peep.name, peep.politics)
						Person.rep_votes.push(peep)
					else
						changed_mind(true, peep.name, peep.politics)
						Person.dem_votes.push(peep)
					end

				when peep.politics.downcase == "neutral"
					if probability(50)
						puts "I'm #{peep.name}. I'm #{peep.politics} so I'm not sure whether I changed my mind."
						Person.rep_votes.push(peep)
					else
						puts "I'm #{peep.name}. I'm #{peep.politics} so I'm not sure whether I changed my mind."
						Person.dem_votes.push(peep)
					end 

				when peep.politics.downcase == "liberal"
					if probability(25)
						changed_mind(false, peep.name, peep.politics)
						Person.dem_votes.push(peep)
					else
						changed_mind(true, peep.name, peep.politics)
						Person.rep_votes.push(peep)
					end

				when peep.politics.downcase == "socialist"
					if probability(10)
						changed_mind(false, peep.name, peep.politics)
						Person.dem_votes.push(peep)
					else
						changed_mind(true, peep.name, peep.politics)
						Person.rep_votes.push(peep)
					end
				else
					puts "For some reason. We're not finding your politics...please update your politics before voting."
				end	
			end
			puts "----------------------------------------"
		tally()
    end
end