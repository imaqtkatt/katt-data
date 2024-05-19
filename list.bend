def List/pure(x):
  return [x]

def List/fmap(f, list):
  fold list:
    case List/Nil:
      return List/Nil
    case List/Cons:
      return List/Cons(f(list.head), list.tail)

def List/seq(f, u):
  match f:
    case List/Cons:
      match u:
        case List/Cons:
          return List/Cons(
            f.head(u.head),
            List/append(List/fmap(f.head, u.tail), List/seq(f.tail, u.tail)),
          )
        case List/Nil:
          return List/Nil
    case List/Nil:
      return List/Nil

def List/append(xs, ys):
  match xs:
    case List/Cons:
      return List/Cons(xs.head, List/append(xs.tail, ys))
    case List/Nil:
      return ys
