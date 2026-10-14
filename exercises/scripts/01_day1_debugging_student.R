# ==============================================================================
# ENCUENTRA EL ERROR - DÍA 1 (versión ESTUDIANTE)
# Curso: Introducción a la programación y análisis de datos en R (v2026.2)
# Filip Andras - CIMCYC, Universidad de Granada
#
# Cada problema tiene código que NO hace lo que queremos. A veces R da un
# error, a veces solo un aviso, y a veces no dice nada pero el resultado es
# incorrecto: estos últimos son los más peligrosos, porque solo los detecta
# quien comprueba el resultado.
#
# Este script tiene errores A PROPÓSITO: no lo ejecutes entero (Source).
#
# Cómo usar este script:
#   1. Ejecuta el código de cada problema línea a línea (Ctrl/Cmd + Enter).
#   2. Lee con calma el mensaje de R, si lo hay, y mira el resultado.
#   3. Explica qué falla y escribe la corrección donde pone TU_CODIGO_AQUI.
# ==============================================================================

# --- Paquetes -----------------------------------------------------------------
# Instalar solo la primera vez (quita el # para ejecutarlo):
# install.packages(c("tidyverse", "here"))

library(tidyverse)   # read_csv(), ...
library(here)        # rutas desde la raíz del proyecto: here("data", "raw_data", ...)


# ==============================================================================
# BLOQUE 2: calculadora, variables, tipos de datos, vectores, NA e indexación
# ==============================================================================

## PROBLEMA 1 ----
# Queremos: redondear 3.14159 a dos decimales.
# Qué pasa: da error

Round(3.14159, 2)

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 2 ----
# Queremos: calcular el doble de la puntuación total.
# Qué pasa: da error

puntuacion_total <- 18
puntuacion_totl * 2

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 3 ----
# Queremos: comprobar si el peso es 65 (que R responda TRUE o FALSE).
# Qué pasa: no da error, pero el resultado no es el que queremos

peso <- 70
peso = 65
peso

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 4 ----
# Queremos: sumar un año a la edad.
# Qué pasa: da error

edad <- "34"
edad + 1

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 5 ----
# Queremos: guardar el nombre de una paciente en la variable `nombre`.
# Qué pasa: da error

nombre <- Ana

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

# Para los tres problemas siguientes, ejecuta primero esto (está bien):

bai <- c(12, NA, 28, 7, 45)

## PROBLEMA 6 ----
# Queremos: contar cuántos pacientes tienen una puntuación BAI mayor de 20.
# Qué pasa: no da error, pero el resultado no es el que queremos

sum(bai > 20)

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 7 ----
# Queremos: quedarnos solo con las puntuaciones mayores de 20.
# Qué pasa: no da error, pero el resultado no es el que queremos

bai[bai > 20]

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 8 ----
# Queremos: el primer y el tercer valor de `bai`.
# Qué pasa: da error

bai[1, 3]

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 9 ----
# Queremos: la media de 12, 28 y 7 (debería ser 15.67).
# Qué pasa: no da error, pero el resultado no es el que queremos

mean(12, 28, 7)

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 10 ----
# Queremos: la mediana de 12, 28 y 100 (debería ser 28).
# Qué pasa: no da error, pero el resultado no es el que queremos

puntuaciones <- c(12, 28, "100")
median(puntuaciones)

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI


# ==============================================================================
# BLOQUE 3: data frames, paquetes, importar datos, exploración inicial
# ==============================================================================

# Para los dos problemas siguientes, ejecuta primero esto (está bien):

pacientes <- data.frame(
  id    = c(1, 2, 3, 4),
  grupo = c("CBT", "placebo", "CBT", "placebo"),
  edad  = c(34, 28, 45, 31),
  bai   = c(28, 14, 35, 19)
)

## PROBLEMA 11 ----
# Queremos: la edad media de los pacientes.
# Qué pasa: da un aviso (warning)

mean(pacientes$Edad)

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 12 ----
# Queremos: las filas de los pacientes con BAI de 26 o más.
# Qué pasa: no da error, pero el resultado no es el que queremos

pacientes[pacientes$bai >= 26]

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 13 ----
# Queremos: un data frame con 4 pacientes.
# Qué pasa: da error

pacientes2 <- data.frame(
  id    = c(1, 2, 3, 4),
  grupo = c("CBT", "placebo", "CBT"),
  edad  = c(34, 28, 45, 31)
)

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 14 ----
# Queremos: leer el archivo data_gad.csv.
# Qué pasa: da error

gad <- read_csv(here("data", "data_gad.csv"))

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 15 ----
# Queremos: la puntuación GAD-7 media antes del tratamiento (`gad_pre`), con
#   el `gad` cargado en el problema anterior (ya corregido).
# Qué pasa: da un aviso (warning)

mean(gad$gad_pre, na.rm = TRUE)

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

# ==============================================================================
sessionInfo()
