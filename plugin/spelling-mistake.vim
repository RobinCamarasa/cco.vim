" Based on this tutorial https://www.youtube.com/watch?v=lwD8G1P52Sk&t=18s
function! s:FixSpellingError()
    normal! mm[s1z=`m
endfunction

function! s:MultiChoiceFixSpellingError()
    execute 'normal! mm[sz='
    let choice=input('Choice: ')
    silent execute 'normal! ' . choice . 'z=`m'
endfunction

function! s:ModifyWord()
    execute 'normal! z='
    let choice=input('Choice: ')
    silent execute 'normal! ' . choice . 'z='
endfunction

nnoremap <leader>lc :call <SID>FixSpellingError()<CR>
nnoremap <leader>lC :call <SID>MultiChoiceFixSpellingError()<CR>
nnoremap <leader>lm :call <SID>ModifyWord()<CR>

function! s:SetSpellang(lang)
    if &spelllang != a:lang || &spell == 0
        execute 'set spell spelllang=' . a:lang
        echo 'Set lang : ' . a:lang
        set complete+=kspell
    else
        echo 'Deactivate : ' . &spelllang
        set nospell
    end
endfunction

nnoremap <leader>le :call <SID>SetSpellang("en")<CR>
nnoremap <leader>ls :call <SID>SetSpellang("es")<CR>
nnoremap <leader>lf :call <SID>SetSpellang("fr")<CR>
nnoremap <leader>ln :call <SID>SetSpellang("nl")<CR>
