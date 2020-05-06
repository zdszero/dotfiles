# Defined in - @ line 1
function gp --wraps='cd (xclip -o)' --description 'alias gp cd (xclip -o)'
  cd (xclip -o) $argv;
end
