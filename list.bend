def List/pure(x):
  return [x]

def List/fmap(f, list):
  fold list:
    case List/Cons:
      return List/Cons(f(list.head), list.tail)
    case List/Nil:
      return List/Nil

def List/seq(f, u):
  fold f:
    case List/Cons:
      return List/append(List/fmap(f.head, u), f.tail)
    case List/Nil:
      return List/Nil

def List/append(xs, ys):
  fold xs:
    case List/Cons:
      return List/Cons(xs.head, xs.tail)
    case List/Nil:
      return ys
