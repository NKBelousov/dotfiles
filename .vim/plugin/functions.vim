function! StickyCursor()
    if &scrolloff
        set scrolloff=0
    else
        set scrolloff=9999
    endif
endfunction
