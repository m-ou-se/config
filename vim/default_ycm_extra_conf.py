def FlagsForFile(filename):
    return {
        'flags': [
            '-Wall',
            '-Wextra',
            '-std=c++1y',
            '-x', 'c++',
            '-I', '.'
        ],
        'do_cache': True
    }
