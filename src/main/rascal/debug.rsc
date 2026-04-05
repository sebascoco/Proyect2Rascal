module debug
 
import Syntax;
import ParseTree;
import IO;
 
void main(list[str] _args) {
  str input = "defmodule MyModule end";
  println("Testing Parser with Ambiguity Detection");
  println("======================================");
  println("Parsing: <input>");
  
  try {
    Tree t = parse(#start[Syntax], input, allowAmbiguity=true);
    println("✓ Parse succeeded (possibly ambiguous)");
    
    bool foundAmbiguity = false;
    visit(t) {
      case amb(alternatives): {
        foundAmbiguity = true;
        int ambCount = 0;
        for (_ <- alternatives) {
          ambCount += 1;
        }
        println("\n✗ AMBIGUITY DETECTED with <ambCount> alternatives:");
        int i = 0;
        for (alt <- alternatives) {
          println("--- Alternative <i> ---");
          println("<alt>");
          i += 1;
        }
      }
    }
    
    if (!foundAmbiguity) {
      println("✓ No ambiguities found - parse is unambiguous");
    }
    
  } catch e: {
    println("✗ Parse failed");
    println("  Error: <e>");
  }
}