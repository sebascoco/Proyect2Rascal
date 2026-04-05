# Proyect2Rascal

Proyecto de parser en Rascal para un lenguaje definido en este repositorio.

## Requisitos

- Java 11 o superior
- Maven
- VS Code con extensión de Rascal (recomendado)

## Estructura importante

- src/main/rascal/Syntax.rsc: gramática
- src/main/rascal/AST.rsc: tipos de AST
- src/main/rascal/Main.rsc: punto de entrada principal
- src/main/rascal/Prueba.alu: archivo de ejemplo

## Cómo ejecutar

### Opción 1: desde la terminal de Rascal en VS Code (recomendada)

1. Abre el proyecto en VS Code.
2. Abre una Rascal terminal.
3. Importa el módulo principal:

	import Main;

4. Ejecuta con el archivo de ejemplo:

	main();

5. O ejecuta con tu propio archivo .alu:

	main(["/ruta/completa/a/tu/archivo.alu"]);

## Verificación de compilación con Maven

En la raíz del proyecto ejecuta:

mvn -q -DskipTests package

Si termina sin errores, los módulos Rascal del proyecto compilan correctamente.

## Qué salida esperar

- Si todo va bien:
  - Parse succeeded!
  - AST conversion succeeded!
- Si hay error de sintaxis:
  - ERROR: ParseError(...)

## Notas

- El método main() en Main.rsc usa por defecto el archivo Prueba.alu.
- Para evitar problemas de ruta, usa rutas absolutas cuando llames main([...]).
