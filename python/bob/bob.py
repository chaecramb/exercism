import re

def hey(what):
  what = what.strip()
  if what == '':
    return 'Fine. Be that way!'
  elif re.search('[a-zA-Z]', what) and what == what.upper():
    return "Whoa, chill out!"
  elif what.endswith('?'):
    return "Sure."
  return "Whatever."
