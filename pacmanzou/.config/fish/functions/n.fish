# Defined in - @ line 1
function n --description 'alias n nvim (fd --type f --hidden --exclude .git | fzf-tmux)'
	nvim (fd --type f --hidden --exclude .git | fzf-tmux) $argv;
end
