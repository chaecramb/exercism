def hey(phrase):
  phrase = phrase.strip()
  if is_silence(phrase):
    return 'Fine. Be that way!'
  elif is_shouting(phrase):
    return "Whoa, chill out!"
  elif is_question(phrase):
    return "Sure."
  return "Whatever."

def is_silence(phrase):
  return phrase == ''

def is_shouting(phrase):
  return phrase.isupper()

def is_question(phrase):
  return phrase.endswith('?')

