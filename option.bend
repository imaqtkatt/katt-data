type Option:
  Some { value }
  None

# use Option/{Some, None} :(

def Option/pure(value):
  return Option/Some(value)

def Option/seq(f, u):
  match f:
    case Option/Some:
      return Option/fmap(f.value, u)
    case Option/None:
      return Option/None

def Option/fmap(f, option):
  match option:
    case Option/Some:
      return Option/Some(f(option.value))
    case Option/None:
      return Option/None

def Option/bind(option, f):
  match option:
    case Option/Some:
      return f(option.value)
    case Option/None:
      return Option/None
