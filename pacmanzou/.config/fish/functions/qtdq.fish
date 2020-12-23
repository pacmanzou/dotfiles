# Defined in - @ line 1
function qtdq --wraps='sudo pacman -Rns (pacman -Qtdq)' --description 'alias qtdq sudo pacman -Rns (pacman -Qtdq)'
  sudo pacman -Rns (pacman -Qtdq) $argv;
end
