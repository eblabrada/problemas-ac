## Consideraciones Generales

Este proyecto consiste en dar solución a problemas computacionales utilizando Máquinas de Estados Algorítmicas (ASM) empleando circuitos simulados en *Logisim*, y utilizando el Lenguaje Ensamblador *NASM*.

Según el ejercicio indiciado se debe hacer dos implementaciones:

- La primera consistirá en una ASM que se debe implmentar sobre la plantilla BigASM.

- La segunda implementación consiste en generar un archivo `.asm` con el código en ensamblador *NASM* que dé solución al problema.

Se deben tener en cuenta las consideraciones generales para *Logisim* y *NASM* dadas en este documento, y las consideraciones particulares por cada uno de los problemas.

**IMPORTANTE**: Por cada ejercicio debe entregar la solución en pseudocódigo (o código en cualquier lenguaje de programación), la solución en Logisim (basado en la plantilla), y la solución en esnamblador (`.asm`). Sin embargo, puede incluir los diagramas de flujo de la Máquina de Estados Algorítmica, e incluso las Tablas de Asignaciones.

## Logisim

Se dispondrá de una plantilla en Logisim para realizar la implemetación de la Máquina de Estados Algorítmica. Queda prohibida la modficación de cualquiera de los circuitos salvo `BIG ASM`, en cuyo caso sí se deben respetar las entradas y salidas dadas. Además NO puede utilizar las componentes `RAM`, ni `ROM`, así como los circuitos `INPUT` y `MEMORY`. Una vez que termine la ejecución del programa debe activar la salida `END` (como se explicará más adelante), y mantener dicho esta persistente hasta que se haga un reinicio manual.

Esta plantilla cuentas con 4 circuitos principales, y 3 secundarios que se explicarán a continuación.

### Circuitos Principales

Los circuitos principales que se usarán para la implementación de la ASM son:

- `INPUT`: Una memoria de solo lectura con los datos de entrada para el circuito. Cada dirección de memoria indiza una palabra de tamaño de 4 bytes (32 bits). Las direcciones de memoria son de 24 bits; por lo tanto se tienen $2^{24}$ datos de 32 bits almacenados.

- `MEMORY`: Una memoria de lectura y escritura. Tiene las mismas características que la memoria `INPUT`, solo que también permite guardar información.  

- `BOARD BIG ASM`: Circuito que integra las componentes `INPUT`, `MEMORY`, y `BIG ASM`, con una pantalla. En esta última se debe proyectar la salida de la Máquina de Estados Algorítmica que se implemente.

- `BIG ASM`: Circuito de la Máquina de Estado Algorítmica que se debe implementar. Solo tiene definida cada una de las entradas y salidas.
    - `DIR INPUT`: Salida de 24 bits. Dirección del dato de la Memoria `INPUT` que se desea leer.
    - `DATA INPUT`: Entrada de 32 bits. Dato en la dirección que indica `DIR INPUT`, almacenado en la Memoria `INPUT`.
    - `DIR MEMORY`: Salida de 24 bits. Dirección en la Memoria `MEMORY`, de la palabra en donde se desea escribir o se desea leer.
    - `Write MEMORY`: Salida de 1 bit. Indica si se desea escribir en `MEMORY` (1), o si se desea leer de `MEMORY` (0).
    - `MEMORY OUT`: Salida de 32 bits. Dato que se desea guardar en la dirección `DIR MEMORY` de `MEMORY`.
    - `MEMORY IN`: Entrada de 32 bits. Dato en la dirección que indica `DIR INPUT`, almacenado en `MEMORY`.
    - `ASCII`: Salida de 7 bits. Caracter del sistema ASCII que se desea imprimir por la pantalla.
    - `Write ASCII`: Salida de 1 bit. Indica si se desea escribir en pantalla en carcater que está en `ASCII` (1), o si no se desea imprimir nada (0).
    - `END`: Salida de 1 bit. Indica si el programa ya terminó (1), o si aún no lo ha hecho (0).
    - `CLR`: Entrada de 1 bit. Clásico *Reset*. Reinicia el sistema. Además mientras se mantenga en (1) no debe empezar la ejecución de la máquina. Cuando cambia a (0) debe comenzar la ejecución.
    - `CLK`: Entrada de 1 bit. Entrada del Reloj.

En `INPUT` siempre se dispondrá de los valores inciales, y se asegura que serán consistentes para cada problema. Debido a la estructura de `INPUT`, se añade la siguiente notación para hacer referencia a cada palabra en dicha memoria.

- $w_i$: indica la palabra (de tamaño 4 bytes), que se encuentra en la dirección $i$ de la memoria `INPUT`.
- $w_{i:j}$: indica el array de palabras que se encuentran desde la direccioón $i$ de `INPUT`, hasta la dirección $j$.

Por simplicidad, tanto `INPUT` como `MEMORY` no necesitan esperar ciclos de reloj para leer un dato particular. En el caso de la escritura en `MEMORY`, solo se necesita de un *Rising Edge* para guardar un dato en una dirección específica.

### Circuitos Secundarios

Como es necesario imprimir en la pantalla proporcionada se brindan dos circuitos que facilitan la escritura de números enteros con signo (`PRINT DEC`) o sin signo (`PRINT UDEC`).

Estos circuitos son *ASMs* que reciben el número que se desea imprimir, y se activan con la entrada `start`. Cuando ambos inician se debe esperar a que termine la escritura en pantalla, que no es más que esperar a que la salida `END` de estos circuitos, se active. Se debe tener en cuenta que ambos circuitos están diseñados para mostrar su estado de finalización durante solamente un ciclo del reloj; por lo tanto preste atención a dicha salida.

Adicionalmente se dispone del circuito `TEST PRINT` para que pruebe y se familiarice con el funcionamiento de los circuitos `PRINT DEC` y `PRINT UDEC`.

## NASM

Solo se permitirá utilizar las subrutinas y macros externas definidas en `io.inc`. Cualquier subrutina que emplee, debe ser implementada. En la section `.data` se pueden definir tantos valores constantes como se desee, pero debe agregar los nombres de constantes que se especifican en cada problema, ya que la entrada se dispondrá de dicha forma. Por lo tanto si un problema exige las entradas `A` (número) y el array `lista`, debe definir estas en dicha sección con dicho nombre.

En la sección `.bss` puede definir el espacio en memoria que necesite con algún fin específico. Sin embargo, se prefiere utilizar más la *Pila*, y solo cuando sea necesario, la sección `.bss`.

El código de la implementación se debe desarrollar en la sección `.text`. Para los llamados de subrutina se recomienda utilizar la convención de llamada *cdecl* (C declaration). Lo esencial de este convenio es que la función que realiza el llamado a la subrutina es la encargada de pasar los parámetros a la pila, y limpiarla al retorno. Implementar bien este convenio permite el llamado directo desde el lenguaje C y C++. Si lo desea puede implementar otro convenio como *stdcall*; pero debe saber explicar el convenio implementado.

## Lista de Problemas

