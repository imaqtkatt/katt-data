object Logger { run }

def Logger/pure(x):
  return Logger { run: (x, String/Nil) }

def Logger/make(x, log):
  return Logger { run: (x, log) }

def Logger/fmap(f, logger):
  open Logger: logger
  (ret, log) = logger.run
  return Logger { run: (f(ret), log) }

def Logger/seq(f, u):
  open Logger: f
  open Logger: u
  (g, log1) = f.run
  (ret, log2) = u.run
  return Logger { run: (g(ret), String/append(log1, log2))  }

def Logger/bind(logger, f):
  open Logger: logger
  (ret, log1) = logger.run
  a = f(ret)
  open Logger: a
  (u, log2) = a.run
  return Logger { run: (u, String/append(log1, log2)) }

def String/append(xs, ys):
  fold xs:
    case String/Cons:
      return String/Cons(xs.head, xs.tail)
    case String/Nil:
      return ys
