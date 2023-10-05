function! unite#kinds#asset#define() abort
    return {
    \   'name': 'asset',
    \   'default_action': 'yank_filename',
    \   'action_table': {
    \       'yank_filename': {
    \           'func': function('s:Action_yank'),
    \           'description': 'Yank the file name',
    \       },
    \   },
    \ }
endfunction

function! s:Action_yank(candidate) abort
    let filename = a:candidate.word
    call setreg('"', filename)
endfunction

