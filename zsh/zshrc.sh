#Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000 
	setopt inc_append_history # To save every command before it is executed 
	setopt share_history # setopt inc_append_history

# Aliases
	alias v="vim -p"
	
	# This is currently causing problems (fails when you run it anywhere that isn't a git project's root directory)
	# alias vs="v `git status --porcelain | sed -ne 's/^ M //p'`"

# Settings
	export VISUAL=vim

source $DOTPATH/zsh/plugins/fixls.zsh

#Functions
	# Custom cd
	c() {
		cd $1;
		ls;
	}
	alias cd="c"

# For vim mappings: 
	stty -ixon

source $DOTPATH/zsh/plugins/oh-my-zsh/lib/history.zsh
source $DOTPATH/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source $DOTPATH/zsh/plugins/oh-my-zsh/lib/completion.zsh
source $DOTPATH/zsh/plugins/vi-mode.plugin.zsh
source $DOTPATH/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DOTPATH/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTPATH/zsh/keybindings.sh

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source $DOTPATH/zsh/prompt.sh
alias vrc='vim $DOTPATH/vim/vimrc.vim'

git config --global user.email "dr.gois88@gmail.com"
git config --global user.name "DoutorGois"
git config --global core.editor vim
git config --global merge.tool vimdiff
alias yoda01_jupyter="sudo docker run -it -p 8443:8888 -v /home/zetdg/data:/home/jovyan -v /home/zetdg/notebook:/home/jovyan/notebook -v /mnt/nfs/dados_nas/proc:/home/jovyan/proc -v /mnt/nfs/dados_nas/raw:/home/jovyan/raw -v /mnt/nfs/dados_nas/digest:/home/jovyan/digest -v /mnt/nfs/dados_nas/report:/home/jovyan/report -e NB_UID=1000 -e NB_GID=100 -e GRANT_SUDO=yes jupyter/datascience-notebook start-notebook.sh --NotebookApp.token=''"

mkdir -p $HOME/.vim

ln -sfn $DOTPATH/vim/autoload $HOME/.vim
ln -sfn $DOTPATH/vim/bundle $HOME/.vim

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


vtex(){
	echo $#
	vim --servername vim "$1"
}

alias vdoc='cd ~/doutorado && vtex ~/doutorado/main.tex'

#alias vtex='$(vim --servername vim $0)'
alias ssh_yoda1="ssh -X -L 8888:yoda01.neuro.ufrn.br:8443 zetdg@yoda01.neuro.ufrn.br -p2222 -t 'tmux a -t Generic || tmux new -s Generic'"
alias ssh_yoda="ssh -X -L 8888:177.20.140.1:8443 zetdg@177.20.140.1 -p2222 -t 'tmux a -t Generic || tmux new -s Generic'"

