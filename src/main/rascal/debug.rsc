module verilang::Debug
 
import verilang::Syntax;
import ParseTree;
import IO;
 
void main(list[str] args) {
  str input = "defmodule MyModule defrule (impl p q) -\> (disj (neg p) q) end end";
  println("Parsing: <input>");
  Tree t = parse(#start[Module], input, allowAmbiguity=true);
  println("Parse succeeded (possibly ambiguous)");
  visit(t) {
    case amb(alternatives): {
      println("\nAmbiguity found with <size(alternatives)> alternatives:");
      int i = 0;
      for (alt <- alternatives) {
        println("--- Alternative <i> ---");
        println("<alt>");
        i += 1;
      }
    }
  }
}