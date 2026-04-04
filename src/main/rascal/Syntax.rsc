module Syntax

keyword Keywords //Para highlighting dfel punto 1
  = "defmodule" | "using"     | "defspace"    | "defoperator"
  | "defvar"    | "defrule"   | "defexpression"| "end"
  | "forall"    | "exists"    | "in"           | "and"
  | "or"        | "neg"       | "defer"        | "True"
  | "False"     | "None"
  ;


// 1. Extensiones para manejo de espacios y tipos estándar
extend lang::std::Layout;

// 2. Definiciones Léxicas (Terminales básicos)  REVISAR CAMBIOS CON EL WORD
lexical Letter = [a-z];
lexical Digit = [0-9];
lexical Char = Letter | Digit | "-";
lexical Identifier = Letter Char* !>> (Letter | Digit | "-") \ Keywords;    
lexical IntLit = Digit+;
lexical FloatLit = Digit+ "." Digit+ ; //Hay Float?
lexical BoolLit  = "True" | "False" | "None";
lexical StrLit = "\"" (Char | " ")+ "\"";
lexical NullVal  = "ø";



// 3. Símbolo Inicial
start syntax Syntax = Module;

// 4. Reglas de Producción
syntax Module = "defmodule" Identifier Imports? Body "end" ;

syntax Imports = ("using" Identifier)+;

syntax Body = (Space | Operators | Variables | Rules | ExpressionDef)* ;

syntax Space = "defspace" Identifier SubSpaces? "end" ;

syntax SubSpaces = "\<" Identifier ;

syntax Operators = "defoperator" Identifier ":" CurryingNotation Attributes? "end" ;

syntax CurryingNotation = Identifier "-\>" Identifier ("-\>" Identifier)* ;

syntax Variables = "defvar" VarDef(" " VarDef)* "end" ;

syntax VarDef = Identifier ":" Identifier ;
 
syntax Rules = "defrule" AplicarOperator "-\>" AplicarOperator "end" ; 

syntax ExpressionDef = "defexpression" Expression Attributes? "end" ;

syntax Expression = QuantifierExpression | LogicalExpression ;

syntax QuantifierExpression = ("forall" | "exists" ) Identifier "in" Identifier "." Expression ; // PReguntar si esta bien en simbolos o poner forall y exists

syntax LogicalExpression = Term (("and" | "or" | "≡" | "=\>" | "=" | "\<" | "\>" | "\<=" | "\>=" | "\<\>") Term) * ; 

syntax Term = "(" Expression ")" | AplicarOperator | Identifier | Literal ;

syntax AplicarOperator = "(" Identifier Argument* ")" ;

syntax Argument = Term;

syntax Attributes = "[" DentroAtribute+ "]" ; // Revisar si es opcional o no tener algo dentro de los corchetes

syntax DentroAtribute = Identifier (":" (Identifier | Literal))? ;

syntax Literal = IntLit | FloatLit | BoolLit | StrLit | NullVal ;


