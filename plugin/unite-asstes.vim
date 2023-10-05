if !exists(':Unite')
    finish
endif

command! -nargs=? -complete=dir UniteAssets Unite assets <args>
command! YankFileName let filename = fnamemodify(@", ':t') | put=filename
