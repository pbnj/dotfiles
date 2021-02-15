function ls
	if type -q exa
		exa $argv
	else
		ls $argv
	end
end

function ll
	if type -q exa
		exa --all --classify --long --git --group-directories-first $argv
	else
		ls -alFh $argv
	end
end
