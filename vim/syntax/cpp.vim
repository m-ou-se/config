if exists("b:current_syntax")
	finish
endif

syn keyword cppStatement    static_assert
syn keyword cppType         override final constexpr
syn keyword cppExceptions   noexcept
syn keyword cppOperator     decltype alignas alignof
syn keyword cppStorageClass thread_local
syn keyword cppConstant     nullptr

syn region cppRawString  matchgroup=cppRawDelim start=+R"\z([[:alnum:]_{}[\]#<>%:;.?*+\-/\^&|~!=,"']*\)(+ end=+)\z1"+ contains=@Spell

hi def link cppConstant Constant
hi def link cppRawDelim cFormat
hi def link cppRawString String
