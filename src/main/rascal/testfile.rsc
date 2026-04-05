module testfile
 
import AST ;
import IO;
 
void main(list[str] args) {
  loc f = |file:///Users/carlagonzalez/Desktop/PLE-secondproject/tests/example1.vl|;
  println("Parsing: <f>");
  try {
    str src = readFile(f);
    AModule ast = loadVeriLang(src);
    println("PASSED  (module: <ast.name>)");
    println("  imports:     <size(ast.imports)>");
    println("  definitions: <size(ast.defs)>");
    for (d <- ast.defs) println("    <d>");
  } catch e: {
    println("FAILED");
    println("  Error: <e>");
  }
}