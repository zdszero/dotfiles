function EV#Commander(...)
  " if no parameters, edit vimrc
  if a:0 == 0
    edit $MYVIMRC
    return 0
  endif

  let l:arg = a:1

  " option
  if l:arg == 'o'
    edit ~/.config/nvim/option.vim
  elseif l:arg == 'm'
    edit ~/.config/nvim/mapping.vim
  elseif l:arg == 'p'
    edit ~/.config/nvim/plugin.vim
  elseif l:arg == 'c'
    edit ~/.config/nvim/command.vim
  elseif l:arg == 's'
    let v:errmsg = ''
    silent! exe 'UltiSnipsEdit'
    if v:errmsg != ''
      exe 'CocCommand snippets.editSnippets'
    endif
  else
    echoerr 'Option not defined!'
  endif

endfunction
