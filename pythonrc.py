try:
    import readline
except ImportError:
    print('readline could not be imported')
    print('tab completion will not be available')
else:
    import rlcompleter
    readline.parse_and_bind('tab: complete')
