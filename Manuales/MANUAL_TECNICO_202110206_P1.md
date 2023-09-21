## Universidad de San Carlos de Guatemala
## Escuela de Ciencias y Sistemas, Facultad de Ingeniería
## Compiladores 1, 2do semestre 2023
-----
# PROYECTO1 - LAB COMPILADORES 1 - SECCIONV B
# MANUAL TECNICO
-----
### Nombre: Julio Alejandro Zaldaña Ríos
### Carnet: 202110206
-----

**Resumen**

En el presente proyecto, se trabaja lo que es un análisis léxico y sintáctico de archivos JSON y  archivos STATPY. Estos se pueden analizar mediante el programa elaborado. Pero para esto, se realizó
y se trabajaron las herramientas de análisis léxico y sintáctico; jflex y CUP, estos fueron de suma importancia para poder realizar el análisis y la traducción por ejemplo de lenguaje StatPy a Python.


**Explicación Archivos y Paquetes**

Se trabajaron cinco paquetes:

![image](https://github.com/julizaldana/OLC1_Proyecto1_202110206/assets/98117383/c90329a9-b4f0-4ad2-8d54-19dc7975d400)

1. __AnalizadorJson:__ Para poder realizar los archivos de LexicoJson.jflex y SintacticoJson.cup, y así sus respectivos de java, para poder realizar la aceptacion de archivos json.
2. __AnalizadorStatpy:__ Para poder realizar los archivos de LexicoStatpy.jflex y SintacticoStatpy.cup, y así poder realizar la traducción y análisis de archivos statpy.
3. __Graficas:__ Se definen algunas clases para realizar graficas de barra y de pie, al igual que TS, donde se tiene una hash table para almacenar valores dentro de las funciones estadisticas.
4. __ReportesHTML:__ Se definen estructuras para poder almacenar, tokens y errores tanto para archivos json y Statpy.
5. __Maininterface:__ Se tiene al main interface, para poder ejecutar el programa, aqui se definen todas las funcionalidades de la interfaz gráfica como tal.

![image](https://github.com/julizaldana/OLC1_Proyecto1_202110206/assets/98117383/94f2bdee-2346-4e2d-9b87-f352c28dcd19)


-----

**Metodos y funcionalidades más importantes**

1. Para abrir archivos y mandarlos a sus respectivos jtextareas, dependiendo de los paneles de JSON y STATPY:
![image](https://github.com/julizaldana/OLC1_Proyecto1_202110206/assets/98117383/765fa5fc-ba4a-4dc9-a653-cd5ea78ea6cb)

2. Boton para poder analizar archivos JSON
![image](https://github.com/julizaldana/OLC1_Proyecto1_202110206/assets/98117383/6510c479-4903-4372-a81a-ca8977cd20d4)

3. Boton para poder analizar archivos STATPY
![image](https://github.com/julizaldana/OLC1_Proyecto1_202110206/assets/98117383/c9669de0-b821-43fb-92fc-c87ef7eb86ca)

4. Estructuras para poder escribir archivos HTML de reportes:

![image](https://github.com/julizaldana/OLC1_Proyecto1_202110206/assets/98117383/ab5b9f3a-5b06-4919-bd53-f0da66fde486)
  

6. Hash table para almacenar datos: clave, valor de los archivos JSON, si se analizan correctamente
![image](https://github.com/julizaldana/OLC1_Proyecto1_202110206/assets/98117383/5a605b24-4934-431b-88f5-6a596f946d07)

7. Estructuras para almacenar errores y tokens:

![image](https://github.com/julizaldana/OLC1_Proyecto1_202110206/assets/98117383/0a277ecd-48af-46ca-b2e3-d8d7bf64a1d5)
![image](https://github.com/julizaldana/OLC1_Proyecto1_202110206/assets/98117383/2300c2b6-332f-444c-88bc-cfa4fbff7995)

6. Funciones para graficas de barras y graficas pie.

![image](https://github.com/julizaldana/OLC1_Proyecto1_202110206/assets/98117383/8fc83e57-4e27-469e-91cc-3acc8515b9e5)
![image](https://github.com/julizaldana/OLC1_Proyecto1_202110206/assets/98117383/e75e655d-cefe-415f-b65e-a62c4cc198d8)

7. Hash table para poder manejar valores para las funciones estadísticas

![image](https://github.com/julizaldana/OLC1_Proyecto1_202110206/assets/98117383/168cc86d-1831-4421-bb44-51f2f7fe6868)



**HERRAMIENTAS**

1. CUP: Para el análisis sintáctico, la declaración de gramáticas, para elaborar estructuras de los archivos, para poder aceptarlos.
2. JFLEX: Para el análisis léxico, ayudó para poder declarar todos los elementos léxicos, que se tenían que aceptar en los archivos.
3. JFREECHART: Librería de Java, que sirvió para poder graficar y realizar ese funcionamiento en el proyecto.
4. NETBEANS: Para poder diseñar la interfaz gráfica de Java, al igual que para ejecutar y escribir el codigo del proyecto
5. JCOMMON
