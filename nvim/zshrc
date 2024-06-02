# Zsh configuration file
#
# This file contains various aliases, functions, and configurations to enhance the
# Zsh shell experience. It includes support for iTerm2 shell integration, custom
# 'cd' command, Git shortcuts, Neovim setup, macOS clipboard utilities, and more.
#
# Table of Contents:
# 1. iTerm2 Shell Integration
# 2. Custom 'cd' command
# 3. Git commit and push function
# 4. Directory navigation aliases
# 5. 'lsd' for directory listings
# 6. Neovim shortcuts
# 7. Git command shortcuts
# 8. Default editor
# 9. macOS clipboard utilities
# 10. Neovim file search using 'find' and 'fzf'
# 11. Python alias
# 12. Java Home configuration
# 13. .NET Core SDK tools
# 14. Conda initialization
# 15. GitHub Copilot CLI wrapper functions
# 16. Zsh plugins (syntax highlighting, autosuggestions)
# 17. 'thefuck' alias
# 18. fzf key bindings and fuzzy completion
#
# Requirements:
# - iTerm2 (for shell integration)
# - 'lsd' command (for enhanced directory listings)
# - Neovim (for text editing)
# - 'fzf' command (for file searching)
# - Java 17 (for Java development)
# - .NET Core SDK (for .NET development)
# - Anaconda (for Python development)
# - GitHub CLI (for GitHub Copilot CLI wrapper functions)
# - Zsh plugins: zsh-syntax-highlighting, zsh-autosuggestions
# - 'thefuck' command (for correcting previous console commands)

# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Custom 'cd' command: automatically runs 'ls' after 'cd'
cd() {
    builtin cd "$@" && lsd
}

# Git commit and push with a single command
function gcp() {
  git commit -am "$1" && git push
}

# Directory navigation aliases
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

# Use 'lsd' for directory listings
alias ls='lsd'
alias ll='ls -lAh'  

# Neovim shortcuts
alias nv='nvim'
alias vi='nvim'
alias vim='nvim'

# Quick access to Neovim config directory
alias nvconfig='cd ~/.config/nvim/'  

# Quick access to .zshrc 
alias zshrc='nvim ~/.zshrc'  

# Git command shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias gd='git diff'
alias gl='git log'

# Set Neovim as default editor
export EDITOR='nvim'

# macOS clipboard utilities
alias ccp='pbcopy' # Copy command output to clipboard
alias pst='pbpaste' # Paste from clipboard to terminal

# Neovim file search using 'find' and 'fzf'
function nvf() {
  nvim "$(find . -type f | fzf)"
}
# Example to copy file contents to clipboard (Usage: `ccat <filename>`)
alias ccat='cat <file> | pbcopy'

# Python = Python3
alias python='python3'

# Java Home configuration
export JAVA_HOME=$(/usr/libexec/java_home -v 17)

# Add .NET Core SDK tools
export DOTNET_ROOT=/Users/nathannguyen/.vscode-dotnet-sdk/.dotnet
export PATH="$PATH:/Users/nathannguyen/.dotnet/tools"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Zsh plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# 'thefuck' alias
eval $(thefuck --alias fk)

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# GitHub Copilot CLI wrapper functions
ghcs() {
	FUNCNAME="$funcstack[1]"
	TARGET="shell"
	local GH_DEBUG="$GH_DEBUG"

	read -r -d '' __USAGE <<-EOF
	Wrapper around \`gh copilot suggest\` to suggest a command based on a natural language description of the desired output effort.
	Supports executing suggested commands if applicable.

	USAGE
	  $FUNCNAME [flags] <prompt>

	FLAGS
	  -d, --debug              Enable debugging
	  -h, --help               Display help usage
	  -t, --target target      Target for suggestion; must be shell, gh, git
	                           default: "$TARGET"

	EXAMPLES

	- Guided experience
	  $ $FUNCNAME

	- Git use cases
	  $ $FUNCNAME -t git "Undo the most recent local commits"
	  $ $FUNCNAME -t git "Clean up local branches"
	  $ $FUNCNAME -t git "Setup LFS for images"

	- Working with the GitHub CLI in the terminal
	  $ $FUNCNAME -t gh "Create pull request"
	  $ $FUNCNAME -t gh "List pull requests waiting for my review"
	  $ $FUNCNAME -t gh "Summarize work I have done in issues and pull requests for promotion"

	- General use cases
	  $ $FUNCNAME "Kill processes holding onto deleted files"
	  $ $FUNCNAME "Test whether there are SSL/TLS issues with github.com"
	  $ $FUNCNAME "Convert SVG to PNG and resize"
	  $ $FUNCNAME "Convert MOV to animated PNG"
	EOF

	local OPT OPTARG OPTIND
	while getopts "dht:-:" OPT; do
		if [ "$OPT" = "-" ]; then     # long option: reformulate OPT and OPTARG
			OPT="${OPTARG%%=*}"       # extract long option name
			OPTARG="${OPTARG#"$OPT"}" # extract long option argument (may be empty)
			OPTARG="${OPTARG#=}"      # if long option argument, remove assigning `=`
		fi

		case "$OPT" in
			debug | d)
				GH_DEBUG=api
				;;

			help | h)
				echo "$__USAGE"
				return 0
				;;

			target | t)
				TARGET="$OPTARG"
				;;
		esac
	done

	# shift so that $@, $1, etc. refer to the non-option arguments
	shift "$((OPTIND-1))"

	TMPFILE="$(mktemp -t gh-copilotXXX)"
	trap 'rm -f "$TMPFILE"' EXIT
	if GH_DEBUG="$GH_DEBUG" gh copilot suggest -t "$TARGET" "$@" --shell-out "$TMPFILE"; then
		if [ -s "$TMPFILE" ]; then
			FIXED_CMD="$(cat $TMPFILE)"
			print -s "$FIXED_CMD"
			echo
			eval "$FIXED_CMD"
		fi
	else
		return 1
	fi
}

ghce() {
	FUNCNAME="$funcstack[1]"
	local GH_DEBUG="$GH_DEBUG"

	read -r -d '' __USAGE <<-EOF
	Wrapper around \`gh copilot explain\` to explain a given input command in natural language.

	USAGE
	  $FUNCNAME [flags] <command>

	FLAGS
	  -d, --debug   Enable debugging
	  -h, --help    Display help usage

	EXAMPLES

	# View disk usage, sorted by size
	$ $FUNCNAME 'du -sh | sort -h'

	# View git repository history as text graphical representation
	$ $FUNCNAME 'git log --oneline --graph --decorate --all'

	# Remove binary objects larger than 50 megabytes from git history
	$ $FUNCNAME 'bfg --strip-blobs-bigger-than 50M'
	EOF

	local OPT OPTARG OPTIND
	while getopts "dh-:" OPT; do
		if [ "$OPT" = "-" ]; then     # long option: reformulate OPT and OPTARG
			OPT="${OPTARG%%=*}"       # extract long option name
			OPTARG="${OPTARG#"$OPT"}" # extract long option argument (may be empty)
			OPTARG="${OPTARG#=}"      # if long option argument, remove assigning `=`
		fi

		case "$OPT" in
			debug | d)
				GH_DEBUG=api
				;;

			help | h)
				echo "$__USAGE"
				return 0
				;;
		esac
	done

	# shift so that $@, $1, etc. refer to the non-option arguments
	shift "$((OPTIND-1))"

	GH_DEBUG="$GH_DEBUG" gh copilot explain "$@"
}
