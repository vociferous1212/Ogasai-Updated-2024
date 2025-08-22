script_gatherer = {


	include gatherer
	include grinder
	include combat
	include nav
	inclue


script_nav:navigate to make gathering runners. i.e. don't use auto walk paths - script_grind.autoPath


}


need to set up a menu to load paths from
need to load a path
need bot to run that path
need bot to search for gathering nodes
need bot to move to that gathering node
need bot to 


function script_gatherer:run()

	if we are in combat then
		run combat script
	end

	if a target is near my aggro range then
		attack it first
	end

	if have a gathering node in range then
		gather that node

	else

		run path to search for nodes
	end
end

function script_gatherer:getPath()
end


