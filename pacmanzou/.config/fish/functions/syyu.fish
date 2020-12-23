# Defined in - @ line 1
function syyu --wraps='sudo pacman -Syyu' --description 'alias syyu sudo pacman -Syyu'
  sudo pacman -Syyu $argv; 
end
