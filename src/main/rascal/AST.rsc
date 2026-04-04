module AST

data Syntax = \syntax(Module m) ;

data Module = \module(str name, list[Import] imports, list[BodyDecl] body) ;

data Import = \import(str moduleName) ;

data BodyDecl
  = space(str name, list[str] subSpaces)
  | operator(str name, CurryingNotation currying, list[Attribute] attributes)
  | variables(list[VarDef] defs)
  | rule(AplicarOperator lhs, AplicarOperator rhs)
  | expressionDecl(Expression expr, list[Attribute] attributes)
  ;

data VarDef = varDef(str varName, str typeName) ;

data CurryingNotation = currying(list[str] types) ;

data Attribute = attr(str key, AttributeVal val)
  | attrKey(str key)
  ;

data AttributeVal = attrId(str name)
  | attrLit(Literal lit)
  ;

data Expression = forall(str var, str space, Expression body)
  | exists(str var, str space, Expression body)
  | binOp(Expression lhs, BinOp op, Expression rhs)
  | termExpr(Term t)
  ;

data BinOp = andOp()
  | orOp()
  | equivOp()
  | impliesOp()
  | eqOp()
  | ltOp()
  | gtOp()
  | leqOp()
  | geqOp()
  | neqOp()
  ;

data Term = parenExpr(Expression e)
  | apply(AplicarOperator app)
  | idTerm(str name)
  | litTerm(Literal lit)
  ;

data AplicarOperator = applyOp(str operator, list[Term] args) ;

data Literal = intLit(int val)
  | floatLit(real val)
  | boolTrue()
  | boolFalse()
  | boolNone()
  | strLit(str val)
  | nullLit()
  ;