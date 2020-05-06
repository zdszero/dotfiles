# Defined in - @ line 1
function sp --wraps='pwd | xclip -i' --description 'alias sp pwd | xclip -i'
  pwd | xclip -i $argv;
end
