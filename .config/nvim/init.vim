let &packpath = &runtimepath

let s:config_files = [
         \ '~/.config/nvim/option.vim',
         \ '~/.config/nvim/mapping.vim',
         \ '~/.config/nvim/plugin.vim',
         \ '~/.config/nvim/command.vim',
         \]

function s:load_config()
  for l:filename in s:config_files
    execute 'source ' . expand(l:filename)
  endfor
endfunction

call s:load_config()
