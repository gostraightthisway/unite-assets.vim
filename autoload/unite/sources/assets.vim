function! unite#sources#assets#define() abort
    return {
    \   'name': 'assets',
    \   'description': 'List files recursively in assets directory',
    \   'gather_candidates': function('s:assets_gather_candidates'),
		\   'default_action': 'yank',
    \   'required_pattern_length': 0
    \ }
endfunction

function! s:assets_gather_candidates(args, context) abort
    let l:specified_directory = getcwd()
    if len(a:args) > 0
        let l:specified_directory = a:args[0]
    endif
    let l:assets_directory = l:specified_directory . '/assets'

    " Check if the assets directory exists
    if !isdirectory(l:assets_directory)
        echoerr 'Error: assets directory not found in ' . l:specified_directory
        return []
    endif

    let l:files = globpath(l:assets_directory, '**/*', 1, 1)
    let l:candidates = []
    for l:file in l:files
        call add(l:candidates, {
        \   'word': l:file,
        \   'abbr': l:file,
        \   'action__path': l:file
        \ })
    endfor
    return l:candidates
endfunction

function! s:Action_insert_word(candidate) abort
    let l:word = a:candidate.word
    execute "normal! a" . l:word
endfunction
