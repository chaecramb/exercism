import string

def is_pangram(sentence):  
  if sentence:
    sentence = sentence.lower()
    for c in string.ascii_lowercase:
      if c not in sentence:
        return False
    return True
  else:
    return False