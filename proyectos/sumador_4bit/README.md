# Sumador de 4 bits 

### Integrantes

1. JUAN DAVID MEDELLIN CALDERON
2. ANA SOFIA HEREDIA SILVA
3. JULIAN ESNET RIVEROS ACOSTA
4. MICHAEL STEVEN GAONA MUNOZ


## Documentacion 

El sumador de 4 bits es un circuito digital que utiliza compuertas lógicas (AND, XOR, OR) para realizar operaciones de suma en binario. Para su construcción, se diseñó primero un sumador de 1 bit, que fue instanciado para formar el sumador de 4 bits. Este sumador de 1 bit tiene dos bits de entrada y un acarreo de entrada, generando una suma y un acarreo de salida. Este diseño permite que los sumadores de 1 bit se combinen para 
formar un sumador de 4 bits.

### Diagrama de bloques de el sumador de 4 bits

![alt text](img/image-2.png)

El diagrama representa cómo se conforma el sumador de 4 bits. Este se compone de 4 sumadores de 1 bit, cada uno con dos entradas (A y B), un acarreo de entrada (Ci), un acarreo de salida (Cout) y el producto de la suma (S).

El funcionamiento es en cascada, donde cada sumador realiza una operación lógica comenzando por el menos significativo. Si hay un acarreo, debe ser pasado al siguiente sumador hasta el bit más significativo. Finalmente, en la cuarta etapa, el sumador del bit más significativo toma las dos entradas y el acarreo, realizando la operación para producir la suma S3 y el acarreo final.

El acarreo final es importante, ya que indica si la suma total excede los 4 bits que puede manejar el sumador. Cuando Cout es 1, significa que se necesitan más bits para mostrar el resultado.


### Codigo del sumador de 4 bit

#### Entradas y salidas

El codigo cuenta con dis entras de 4 bits llamda A y otras entrada de 4 bits llamdas B, una salida de un bit llamda Cout y una salida de 4 bits llamda Sum. 

``` 
module sumador_4bit(
        input  [3:0] A,
        input  [3:0] B,
        output       Cout,
        output [3:0] Sum
    );
```
#### Intanciamiento

En este bloque de código, se instancian los 4 sumadores de 1 bit que se conectan en cascada. En las entradas A y B se le asignan su entrada correspondiente del codigo instanciado. En el primer sumador, el acarreo de entrada ci comienza con 0. Cuando se genera una acarreador  ci se le asigana a c1 asi con cada uno sinedo c2 y c3. A cout se le asigna los acarreadores  a los 3 primeros y a al ultimo cout que es el mas significativo se le asigna cout y a sum de cada sumador se le asigna la salida correspondiente. 

```  
   sumador_1bit s0 (.A(A[0]), .B(B[0]), .Ci(1'b0), .Cout(c1), .Sum(Sum[0]));
    sumador_1bit s1 (.A(A[1]), .B(B[1]), .Ci(c1), .Cout(c2), .Sum(Sum[1]));
    sumador_1bit s2 (.A(A[2]), .B(B[2]), .Ci(c2), .Cout(c3), .Sum(Sum[2]));
    sumador_1bit s3 (.A(A[3]), .B(B[3]), .Ci(c3), .Cout(Cout), .Sum(Sum[3]));
endmodule
```
## Simulacion 

![alt text](img/image-3.png)

