# General
set -x LANG "en_US.UTF-8"
set -x LC_COLLATE "en_US.UTF-8"
set -x LC_CTYPE "en_US.UTF-8"
set -x LC_MESSAGES "en_US.UTF-8"
set -x LC_MONETARY "en_US.UTF-8"
set -x LC_NUMERIC "en_US.UTF-8"
set -x LC_TIME "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

# fish snippets (e.g. conf.d) supported as of fish >=2.3.0.
# for older fish shells, uncomment lines below
# for file in ~/.config/fish/conf.d/*.fish
#  source $file
# end

function l --wraps ls
  if [ (uname) = "Darwin" ]
    if type -q gls
      gls -alFh --group-directories-first --color=auto $argv
    else
      if type -q brew
        brew install coreutils
      else
        echo "Install coreutils for mac"
      end
    end
  else
    ls -alFh --group-directories-first --color=auto $argv
  end
end
