# Defined in - @ line 1
function c --description 'alias c cd (fd --type d --hidden --exclude .git | fzf-tmux)'
	cd (fd --type d --hidden --exclude .git | fzf-tmux) $argv;
end
