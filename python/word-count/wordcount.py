import re
from collections import defaultdict

def word_count(phrase):
  frequency_list = defaultdict(int)
  for word in split_phrase(phrase):
    frequency_list[word] += 1 
  return frequency_list

def split_phrase(phrase):
  return re.compile('[^_\W]+').findall(phrase.lower())