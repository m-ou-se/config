def FlagsForFile(filename):
    return {
        'flags': [
            '-Wall',
            '-Wextra',
            '-std=c++11',
            '-x', 'c++',
            '-I', '.'
        ],
        'do_cache': True
    }
