type Either:
  Left { value }
  Right { value }

def Either/pure(value):
  return Either/Right(value)

def Either/seq(f, u):
  match f:
    case Either/Left:
      return Either/Left(f.value)
    case Either/Right:
      return Either/fmap(f.value, u)

def Either/fmap(f, either):
  match either:
    case Either/Left:
      return Either/Left(either.value)
    case Either/Right:
      return Either/Right(f(either.value))

def Either/bind(either, f):
  match either:
    case Either/Left:
      return Either/Left(either.value)
    case Either/Right:
      return f(either.value)
