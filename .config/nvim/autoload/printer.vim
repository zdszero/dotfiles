function printer#PrintRTP () abort
  let l:rtps = split(&rtp, ',')
  for l:rtp in l:rtps
    echo l:rtp
  endfor
endfunction
