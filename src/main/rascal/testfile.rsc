module testfile
 
import Main;
import AST;
import ParseTree;
import IO;
 
void main(list[str] args) {
  // Test with the example file from the project
  loc f = |file:///Users/julianpintocajiao/Downloads/Uniandes/lym/Proyect2Rascal/src/main/rascal/Prueba.alu|;
  
  println("Testing VeriLang Parser");
  println("=======================");
  println("Parsing: <f>");
  
  try {
    // Load and parse the file
    Tree parseTree = loadVeriLangFile(f);
    println("✓ PARSE PASSED");
    
    // Convert to AST
    Syntax ast = tree2ast(parseTree);
    println("✓ AST CONVERSION PASSED");
    
    // Print AST
    println("AST: <ast>");
    
    println("\n✓ ALL TESTS PASSED");
  } catch e: {
    println("✗ TEST FAILED");
    println("  Error: <e>");
  }
}