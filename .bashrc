set -o vi

export PS1="\033[32m\w\033[0m $ "

eval "$(direnv hook bash)"

function switch-my-shi-gng() {
	nix-on-droid switch --flake $XDG_CONFIG_HOME/nix-on-droid $@
}
