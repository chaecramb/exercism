import string

def is_pangram(sentence):  
  sentence = sentence.lower()
  return all(c in sentence for c in string.ascii_lowercase)

