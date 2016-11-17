def encode(s):
  runs = split_into_runs(s)
  encoded_runs = encode_runs(runs)
  return ''.join(encoded_runs);

def split_into_runs(s):
  runs = []
  run = s[0]
  for char in s[1:]:
    if char == run[0]:
      run += char
    else:
      runs.append(run)
      run = char
  runs.append(run)
  return runs;

def encode_runs(runs):
  return [r[0] if len(r) == 1 else str(len(r)) + r[0] for r in runs]

def decode(s):
  coded_runs = split_into_coded_runs(s)
  return ''.join(coded_runs);

def split_into_coded_runs(coded_string):
  runs = []
  factor = '0'
  for char in coded_string:
    if char.isdigit():
      factor += char
    else:
      runs.append(int(factor) * char or char)
      factor = '0'
  return runs

