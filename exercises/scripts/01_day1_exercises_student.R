# ==============================================================================
# EJERCICIOS - DÍA 1 (versión ESTUDIANTE)
# Curso: Introducción a la programación y análisis de datos en R (v2026.2)
# Filip Andras - CIMCYC, Universidad de Granada
#
# Cómo usar este script:
#   1. Lee el enunciado de cada ejercicio (líneas comentadas).
#   2. Escribe tu código donde pone TU_CODIGO_AQUI.
#   3. Ejecuta cada línea con Ctrl/Cmd + Enter y mira la consola.
# ==============================================================================

# --- Paquetes -----------------------------------------------------------------
# Instalar solo la primera vez (quita el # para ejecutarlo):
# install.packages(c("tidyverse", "here"))

library(tidyverse)   # read_csv(), glimpse(), ...
library(here)        # rutas desde la raíz del proyecto: here("data", "raw_data", ...)


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

# TU_CODIGO_AQUI

## EJERCICIO 6: calculadora de IMC ----
# Tiempo: 15 minutos

# 1. Crea variables para tu nombre, edad, altura (m) y peso (kg)
# 2. Calcula tu IMC: `peso / altura^2`
# 3. Comprueba el tipo de cada variable con `class()`
# 4. Convierte tu edad a character con `as.character()` y comprueba qué cambió
# 5. Crea una variable lógica: `es_mayor <- edad > 18`

# TU_CODIGO_AQUI

## EJERCICIO 6 - si te sobra tiempo ----

# 1. Calcula la raíz cuadrada de 144
# 2. Comprueba el tipo de dato que devuelve `sqrt()`
# 3. Crea dos variables lógicas (`tengo_dinero`, `tengo_entrada`) y prueba
#    `&`, `|`, `!` entre ellas
# 4. Crea la variable `puedo_entrar`, usando las variables anteriores, y cuyo
#    resultado sea igual a `TRUE`

# TU_CODIGO_AQUI

## EJERCICIO 7: contar NA y calcular la media ----
# Tiempo: 5 minutos

# Tienes este vector de puntuaciones BAI (Beck Anxiety Inventory, inventario de
# ansiedad de Beck) con valores ausentes:

bai <- c(12, NA, 28, 7, NA, 45, 19)

# 1. ¿Cuántos NA hay? Usa `sum(is.na())`.
# 2. ¿Qué devuelve `mean(bai)`? ¿Por qué?
# 3. Calcula la media ignorando los NA.

# TU_CODIGO_AQUI

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

# TU_CODIGO_AQUI

## EJERCICIO 8 - si te sobra tiempo ----

# 1. ¿Cuál es la puntuación más alta en `bai`?
# 2. La puntuación 45 es un error de registro: debería ser 54. Corrígela usando
#    una condición (sin escribir su posición)
# 3. ¿Cuántos valores únicos hay en el vector? Pista: explora la función `unique()`
# 4. Une el vector `bai` con el vector `etiquetas` en un data frame.
#    Pista: explora la función `data.frame()` (siguiente tema)

# TU_CODIGO_AQUI

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

# TU_CODIGO_AQUI

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

# TU_CODIGO_AQUI

## EJERCICIO 11: explorar el dataset GAD ----
# Tiempo: 20 minutos

# 1. Carga `data_gad.csv` con here() y na = c("N/A", "NA"), y comprueba con
#    glimpse() que `gad_pre` y `gad_post` son numéricas
# 2. ¿Cuántos pacientes no tienen `gad_post`? ¿Cuál es su `patient_id`?
# 3. ¿Cuál es la puntuación GAD-7 media antes (`gad_pre`) y después (`gad_post`)
#    del tratamiento?
# 4. Crea la columna `mejora` = gad_pre - gad_post. ¿Cuál es la mejora media?

# TU_CODIGO_AQUI

## EJERCICIO 11 - si te sobra tiempo ----

# 1. ¿Cuántos pacientes del grupo CBT tenían GAD grave antes del tratamiento?
#    (GAD-7 >= 15)
# 2. ¿Cuál es la mejora media en el grupo CBT? ¿Y en lista de espera?
# 3. Selecciona las filas del grupo CBT con `gad_post` disponible.
#    Pista: gad[condicion, ] (la columna se deja vacía)

# TU_CODIGO_AQUI

# ==============================================================================
sessionInfo()
