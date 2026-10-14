# ==============================================================================
# EJERCICIOS - DÍA 1 (versión SOLUCIONES)
# Curso: Introducción a la programación y análisis de datos en R (v2026.2)
# Filip Andras - CIMCYC, Universidad de Granada
#
# Cómo usar este script:
#   1. Lee el enunciado de cada ejercicio (líneas comentadas).
#   2. Intenta resolverlo antes de mirar la solución.
#   3. Ejecuta cada línea con Ctrl/Cmd + Enter y mira la consola.
# ==============================================================================

# --- Paquetes -----------------------------------------------------------------
# Instalar solo la primera vez (quita el # para ejecutarlo):
# install.packages(c("tidyverse", "here"))

library(tidyverse)   # read_csv(), glimpse(), ...
library(here)        # rutas desde la raíz del proyecto: here("data", "raw_data", ...)


# ==============================================================================
# BLOQUE 1: R y RStudio, primer script
# ==============================================================================

## EJERCICIO 2: RStudio ----
# Tiempo: 10 minutos

# Abre RStudio y prueba lo siguiente:
# 1. Escribe en la CONSOLA y explora:
#    a. ?sum           -> ¿para qué sirve?
#    b. help.start()   -> explora la página
# 2. Escribe en la CONSOLA y observa el resultado:
#    a. 2 + 2
#    b. 10 - 3
#    c. sqrt(16)       -> ¿qué hace esto?
#    d. x <- 10
#    e. y <- 5         -> ¿qué ha pasado en el Environment?
#    f. Ejecuta: x + y -> ¿qué pasa?
# 3. Crea un nuevo script de R:
#    a. En el menú superior: File -> New File -> R Script
#    b. Escribe el siguiente texto:
#         # Mi primer script en R
#         a <- 3
#         b <- 7
#         suma <- a + b
#         suma
#    c. Ejecuta cada línea con Ctrl/Cmd + Enter y observa los resultados en la
#       consola
#    d. Guarda el script con Ctrl/Cmd + S y ponle un nombre (p. ej.,
#       practica_dia_1.R). ¿Dónde lo has guardado?

# Solución:

# 1-2. en la consola
?sum             # abre la ayuda de sum()
# help.start()   # abre la ayuda general de R en el navegador
2 + 2
10 - 3
sqrt(16)         # raíz cuadrada de 16
x <- 10
y <- 5           # x e y aparecen en el panel Environment
x + y            # R usa los valores guardados: 15

# 3. el script (File -> New File -> R Script), guardado como practica_dia_1.R
#    en la carpeta que RStudio tenga como directorio de trabajo (getwd())
# Mi primer script en R
a <- 3
b <- 7
suma <- a + b
suma


# ==============================================================================
# BLOQUE 2: calculadora, variables, tipos de datos, vectores, NA e indexación
# ==============================================================================

## EJERCICIO 5: operaciones con variables ----
# Tiempo: 8 minutos

# 1. Crea una variable llamada `edad` y asígnale el valor 25.
# 2. Calcula el doble de esa edad y guarda el resultado en una nueva variable
#    llamada `doble_edad`.
# 3. Calcula la raíz cuadrada de la edad usando una función de R y guarda el
#    resultado en una variable llamada `raiz_edad`.
# 4. Divide la edad entre 3 y redondea el resultado a 2 decimales. Guarda el
#    resultado en una variable llamada `edad_redondeada`.
# 5. Finalmente, ejecuta cada una de las variables (`doble_edad`, `raiz_edad`,
#    `edad_redondeada`) para ver sus resultados en la consola.

# Solución:

edad <- 25
doble_edad <- edad * 2
raiz_edad <- sqrt(edad)
edad_redondeada <- round(edad / 3, 2)
doble_edad
raiz_edad
edad_redondeada

## EJERCICIO 6: calculadora de IMC ----
# Tiempo: 15 minutos

# 1. Crea variables para tu nombre, edad, altura (m) y peso (kg)
# 2. Calcula tu IMC: `peso / altura^2`
# 3. Comprueba el tipo de cada variable con `class()`
# 4. Convierte tu edad a character con `as.character()` y comprueba qué cambió
# 5. Crea una variable lógica: `es_mayor <- edad > 18`

# Solución:

# 1. crear las variables
mi_nombre <- "Ana"
mi_edad   <- 28
mi_altura <- 1.68
mi_peso   <- 65

# 2. calcular el IMC
mi_imc <- mi_peso / mi_altura^2
mi_imc

# 3. comprobar tipos
class(mi_nombre)    # "character"
class(mi_edad)      # "numeric"

# 4. convertir la edad a texto
mi_edad_texto <- as.character(mi_edad)
class(mi_edad_texto)    # "character"

# 5. variable logica
es_mayor <- mi_edad > 18
es_mayor    # TRUE

## EJERCICIO 6 - si te sobra tiempo ----

# 1. Calcula la raíz cuadrada de 144
# 2. Comprueba el tipo de dato que devuelve `sqrt()`
# 3. Crea dos variables lógicas (`tengo_dinero`, `tengo_entrada`) y prueba
#    `&`, `|`, `!` entre ellas
# 4. Crea la variable `puedo_entrar`, usando las variables anteriores, y cuyo
#    resultado sea igual a `TRUE`

# Solución:

# 1. raiz cuadrada de 144
raiz <- sqrt(144)
raiz

# 2. que tipo de dato devuelve sqrt()?
class(raiz)

# 3. dos variables logicas y los operadores &, |, !
tengo_dinero  <- TRUE
tengo_entrada <- FALSE
tengo_entrada & tengo_dinero     # y: las dos a la vez
tengo_entrada | tengo_dinero     # o: al menos una
!tengo_entrada                   # no: invierte

# 4. puedo_entrar debe ser TRUE
puedo_entrar <- tengo_entrada | tengo_dinero
puedo_entrar

## EJERCICIO 7: contar NA y calcular la media ----
# Tiempo: 5 minutos

# Tienes este vector de puntuaciones BAI (Beck Anxiety Inventory, inventario de
# ansiedad de Beck) con valores ausentes:

bai <- c(12, NA, 28, 7, NA, 45, 19)

# 1. ¿Cuántos NA hay? Usa `sum(is.na())`.
# 2. ¿Qué devuelve `mean(bai)`? ¿Por qué?
# 3. Calcula la media ignorando los NA.

# Solución:

# 1. cuantos NA
sum(is.na(bai))

# 2. sin na.rm: el NA se contagia y la media es NA
mean(bai)

# 3. media ignorando los NA
mean(bai, na.rm = TRUE)

## EJERCICIO 8: analizar puntuaciones de ansiedad ----
# Tiempo: 20 minutos

# Tienes las puntuaciones BAI (Beck Anxiety Inventory) de 10 pacientes:

bai <- c(12, 28, 7, 45, 19, NA, 33, 8, 22, 41)

# 1. Calcula la media, desviación típica y mediana (ignora el NA)
# 2. ¿Cuántos pacientes tienen una puntuación por encima de 20?
# 3. Selecciona las puntuaciones mayores de 20 y elimina los NA, usando
#    indexación lógica (`&`, `|`, `!`)
# 4. Crea un vector `etiquetas` con "bajo" si BAI < 20 o "alto" si BAI >= 20
#    Pista: examina la ayuda de la función `?ifelse()` y úsala apropiadamente

# Solución:

# 1. descriptivos ignorando el NA
mean(bai, na.rm = TRUE)
sd(bai, na.rm = TRUE)
median(bai, na.rm = TRUE)

# 2. cuantos por encima de 20
sum(bai > 20, na.rm = TRUE)

# 3. seleccionar puntuaciones > 20 Y eliminar NA
bai[bai > 20 & !is.na(bai)]

# 4. etiquetar cada puntuacion
etiquetas <- ifelse(test = bai < 20, yes = "bajo", no = "alto")
etiquetas

## EJERCICIO 8 - si te sobra tiempo ----

# 1. ¿Cuál es la puntuación más alta en `bai`?
# 2. La puntuación 45 es un error de registro: debería ser 54. Corrígela usando
#    una condición (sin escribir su posición)
# 3. ¿Cuántos valores únicos hay en el vector? Pista: explora la función `unique()`
# 4. Une el vector `bai` con el vector `etiquetas` en un data frame.
#    Pista: explora la función `data.frame()` (siguiente tema)

# Solución:

# 1. la puntuacion mas alta
max(bai, na.rm = TRUE)

# 2. corregir el 45 por 54: la condicion selecciona el elemento
bai[bai == 45] <- 54
bai

# 3. cuantos valores unicos hay en el vector
length(unique(bai))

# 4. unir bai y etiquetas en un data frame
data.frame(bai, etiquetas)

# ==============================================================================
# BLOQUE 3: data frames, paquetes, importar datos, exploración inicial
# ==============================================================================

## EJERCICIO 9: crear tu propio data frame ----
# Tiempo: 5 minutos

# Crea un `data.frame()` con 5 filas y estas columnas:
# 1. `id` - números del 1 al 5
# 2. `group` - alterna entre "CBT" y "control"
# 3. `anxiety_pre` - puntuaciones ficticias entre 10 y 20
# 4. `anxiety_post` - puntuaciones ficticias entre 5 y 15
# Comprueba las dimensiones del resultado con `dim()` (pista: ?dim).

# Solución:

mi_estudio <- data.frame(
  id           = 1:5,
  group        = c("CBT", "control", "CBT", "control", "CBT"),
  anxiety_pre  = c(15, 18, 12, 20, 14),
  anxiety_post = c(8, 14, 6, 15, 9)
)
mi_estudio
dim(mi_estudio)

## EJERCICIO 10: explorar el data frame ----
# Tiempo: 8 minutos

# Usando el data frame `pacientes` (el de las diapositivas), determina:

pacientes <- data.frame(
  id    = c(1, 2, 3, 4),
  grupo = c("CBT", "placebo", "CBT", "placebo"),
  edad  = c(34, 28, 45, 31),
  bai   = c(28, 14, 35, 19)
)

# 1. ¿Cuántos pacientes hay en el grupo CBT? ¿Y en el placebo?
#    Pista: cuenta con una comparación y sum()
# 2. ¿Cuál es la media de `bai`?
# 3. ¿Cuántos años tiene la persona de mayor edad?
# 4. Crea una columna de texto `bai_categoria`: "grave" si `bai` es 26 o más
#    (punto de corte del BAI para ansiedad grave) y "leve-moderado" si no.
#    Pista: ifelse()
# Nota: para operar con una columna, primero hay que sacarla del data frame con $.

# Solución:

# 1. cuantos pacientes hay en cada grupo
sum(pacientes$grupo == "CBT")
sum(pacientes$grupo == "placebo")

# 2. media de bai
mean(pacientes$bai)

# 3. la persona de mayor edad
max(pacientes$edad)

# 4. columna de texto bai_categoria: "grave" si bai >= 26
pacientes$bai_categoria <- ifelse(pacientes$bai >= 26, "grave", "leve-moderado")
pacientes

## EJERCICIO 11: explorar el dataset GAD ----
# Tiempo: 20 minutos

# 1. Carga `data_gad.csv` con here() y na = c("N/A", "NA"), y comprueba con
#    glimpse() que `gad_pre` y `gad_post` son numéricas
# 2. ¿Cuántos pacientes no tienen `gad_post`? ¿Cuál es su `patient_id`?
# 3. ¿Cuál es la puntuación GAD-7 media antes (`gad_pre`) y después (`gad_post`)
#    del tratamiento?
# 4. Crea la columna `mejora` = gad_pre - gad_post. ¿Cuál es la mejora media?

# Solución:

# 1. cargar con here() y na =, y comprobar los tipos
gad <- read_csv(here("data", "raw_data", "data_gad.csv"), na = c("N/A", "NA"))
glimpse(gad)

# 2. pacientes sin gad_post y su patient_id
sum(is.na(gad$gad_post))
gad$patient_id[is.na(gad$gad_post)]

# 3. media antes y despues (ignorando NA)
mean(gad$gad_pre, na.rm = TRUE)
mean(gad$gad_post, na.rm = TRUE)

# 4. mejora de cada paciente (vectorizacion sobre columnas) y su media
gad$mejora <- gad$gad_pre - gad$gad_post
mean(gad$mejora, na.rm = TRUE)

## EJERCICIO 11 - si te sobra tiempo ----

# 1. ¿Cuántos pacientes del grupo CBT tenían GAD grave antes del tratamiento?
#    (GAD-7 >= 15)
# 2. ¿Cuál es la mejora media en el grupo CBT? ¿Y en lista de espera?
# 3. Selecciona las filas del grupo CBT con `gad_post` disponible.
#    Pista: gad[condicion, ] (la columna se deja vacía)

# Solución:

# 1. CBT con GAD grave antes del tratamiento (GAD-7 >= 15)
sum(gad$group == "CBT" & gad$gad_pre >= 15, na.rm = TRUE)

# 2. mejora media por grupo
mean(gad$mejora[gad$group == "CBT"], na.rm = TRUE)
mean(gad$mejora[gad$group == "lista_espera"], na.rm = TRUE)

# 3. filas del grupo CBT con gad_post disponible
gad[gad$group == "CBT" & !is.na(gad$gad_post), ]

# ==============================================================================
sessionInfo()
