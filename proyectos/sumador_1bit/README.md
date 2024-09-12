# Análisis del Código Verilog y circuito  de un Sumador de 1 Bit  
1. JUAN DAVID MEDELLIN CALDERON
2. ANA SOFIA HEREDIA SILVA
3. JULIAN ESNET RIVEROS ACOSTA
4. MICHAEL STEVEN GAONA MUNOZ
##  1. ¿Qué es?
### inicialmente es el  código corresponde a un testbench para un sumador de 1 bit en Verilog. Un sumador de 1 bit es un circuito combinacional que suma dos bits de entrada (A y B) más un acarreo de entrada (Ci) y genera un bit de suma (S) y un acarreo de salida (Co). Este tipo de sumadores es la base de sumadores más grandes, como los sumadores de n bits.El módulo llamado sumador_1bit_tb es una simulación del funcionamiento del sumador de 1 bit y se utiliza para verificar su comportamiento ante diferentes combinaciones de entradas.

# 2. ¿Cómo funciona internamente?

## a Componentes Principales:
### Entradas:
 A_tb, B_tb y Ci_tb: Estas señales representan las entradas que se asignan para realizar las pruebas al sumador. Simulan los bits que serán sumados.
 Instancia del módulo sumador: El testbench crea una instancia del módulo sumador_1bit llamado uut (unidad bajo prueba). Las señales A_tb, B_tb, y Ci_tb se conectan a las entradas del módulo sumador.


## b. Funcionamiento del Testbench:
 El testbench realiza varias pruebas a través de diferentes combinaciones de los bits de entrada (A, B, Ci) usando una serie de retardos (de 25 unidades de tiempo). Estas combinaciones son:
 (A=0, B=0, Ci=0)
 (A=1, B=0, Ci=0)
 (A=0, B=1, Ci=0) 
 (A=1, B=1, Ci=0)
 (A=0, B=0, Ci=1)
 (A=1, B=0, Ci=1)
 (A=0, B=1, Ci=1)
 (A=1, B=1, Ci=1)
El bloque initial asigna estas combinaciones y las ejecuta secuencialmente, verificando el comportamiento del sumador para cada caso.

## c Resultados Esperados:
El sumador de 1 bit, como circuito combinacional, calculará los resultados de suma (S) y acarreo (Co) para cada combinación de entrada:

 A=0, B=0, Ci=0 → S=0, Co=0
 A=1, B=0, Ci=0 → S=1, Co=0
 A=0, B=1, Ci=0 → S=1, Co=0
 A=1, B=1, Ci=0 → S=0, Co=1
 A=0, B=0, Ci=1 → S=1, Co=0
 A=1, B=0, Ci=1 → S=0, Co=1
 A=0, B=1, Ci=1 → S=0, Co=1
 A=1, B=1, Ci=1 → S=1, Co=1
 El archivo de salida sumador_1bit_tb.vcd es un archivo de forma de onda que contiene la simulación de estas combinaciones. Las formas de onda de A_tb, B_tb, Ci_tb y las salidas (S y Co) se pueden visualizar usando un visualizador de formas de onda como GTKWave.
## 3. Resultados con las Entradas:
 Al ejecutar el testbench, los resultados se observan con las siguientes combinaciones:
 Diagrama de el sumador de 1 bit


### Tabla de Verdad

| A | B | Ci | S (Suma) | Cout (Carry) |
|---|---|----|----------|--------------|
| 0 | 0 | 0  | 0        | 0            |
| 0 | 0 | 1  | 1        | 0            |
| 0 | 1 | 0  | 1        | 0            |
| 0 | 1 | 1  | 0        | 1            |
| 1 | 0 | 0  | 1        | 0            |
| 1 | 0 | 1  | 0        | 1            |
| 1 | 1 | 0  | 0        | 1            |
| 1 | 1 | 1  | 1        | 1            |

## 4. Circuito Real con Compuertas Lógicas
 El sumador de 1 bit puede implementarse utilizando las siguientes compuertas lógicas:

 Compuerta XOR para calcular la suma (S).
 Compuertas AND y OR para calcular el acarreo (Co).
 a Suma (S)
 La salida S es el resultado de la operación XOR entre A, B, y Ci, que se puede descomponer en dos pasos:

Realizar la operación XOR entre A y B.Luego, realizar otra operación XOR entre el resultado de la primera operación y el acarreo de entrada Ci.
 La fórmula para la suma es: 
𝑆=
(
𝐴
⊕
𝐵
)
⊕
𝐶
𝑖
S=(A⊕B)⊕Ci

 b Acarreo de salida (Co)El acarreo de salida Co es 1 cuando dos o más de las entradas son 1. Esto puede calcularse usando las siguientes fórmulas:

 Un acarreo se genera si A y B son ambos 1: 𝐴⋅𝐵 A⋅B Un acarreo también se genera si Ci es 1 y al menos uno de A o B es 1. Esto se representa como: 
𝐶
𝑖
⋅
(
𝐴
⊕
𝐵
)
Ci⋅(A⊕B)
 La fórmula completa del acarreo es: 
𝐶
𝑜=
(
𝐴
⋅
𝐵
)
+
(
𝐶
𝑖
⋅
(
𝐴
⊕
𝐵
)
)
Co=(A⋅B)+(Ci⋅(A⊕B))

![Texto alternativo](img\img1.jpeg)



 5. Esquema del Circuito
 Para S: Usamos dos compuertas XOR. Primero calculamos A ⊕ B, luego el resultado de esa operación se XOR con Ci para obtener la suma final.Para Co: Usamos una compuerta AND para calcular A · B y otra AND para calcular Ci · (A ⊕ B). Finalmente, se usa una compuerta OR para combinar los dos términos y obtener el acarreo de salida.

![Texto alternativo](img\img2.jpeg)


 6. Conclusión:
 El testbench proporciona una forma de verificar el correcto funcionamiento del sumador de 1 bit, simulando varias combinaciones de entradas y analizando las salidas. Se puede observar que el sumador realiza las operaciones esperadas en todas las pruebas, generando correctamente los bits de suma y acarreo.