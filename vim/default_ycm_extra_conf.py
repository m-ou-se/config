def FlagsForFile(filename):
    return {
        'flags': [
            '-Wall',
            '-Wextra',
            '-std=c++17',
            '-x', 'c++',
            '-I', '.'
        ],
        'do_cache': True
    }
