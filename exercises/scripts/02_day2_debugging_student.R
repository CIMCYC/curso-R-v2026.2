# ==============================================================================
# ENCUENTRA EL ERROR - DÍA 2 (versión ESTUDIANTE)
# Curso: Introducción a la programación y análisis de datos en R (v2026.2)
# Filip Andras - CIMCYC, Universidad de Granada
#
# Código con el pipe, los verbos de dplyr y los joins que NO hace lo que
# queremos. A veces R da un error, a veces solo un aviso, y a veces no dice
# nada pero el resultado es incorrecto: estos últimos son los más peligrosos,
# porque solo los detecta quien comprueba el resultado.
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

library(tidyverse)   # read_csv(), el pipe |>, dplyr
library(here)        # rutas desde la raíz del proyecto

# --- Datos (esto está bien) ---------------------------------------------------
data_trial    <- read_csv(here("data", "raw_data",
                               "data_clinical_trial.csv"))
data_followup <- read_csv(here("data", "raw_data",
                               "data_clinical_trial_followup.csv"))
data_sites    <- read_csv(here("data", "raw_data", "data_sites.csv"))

## PROBLEMA 1 ----
# Queremos: quedarnos con los pacientes del grupo CBT.
# Qué pasa: da error

pacientes_cbt <- data_trial |>
  filter(group = "CBT")

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 2 ----
# Queremos: quedarnos con los pacientes de más de 50 años y ordenarlos por
#   edad.
# Qué pasa: da error

mayores <- data_trial |>
  filter(age > 50 |>
  arrange(desc(age))

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 3 ----
# Queremos: calcular el cambio en ansiedad (post - pre) y el cambio en
#   porcentaje del valor inicial.
# Qué pasa: da error

cambios <- data_trial |>
  mutate(cambio_pct = cambio / anxiety_pre * 100,
         cambio     = anxiety_post - anxiety_pre)

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 4 ----
# Queremos: unir los datos del ensayo con los del seguimiento a los 3 meses.
# Qué pasa: da error

datos_completos <- left_join(data_trial, data_followup, by = "patient")

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 5 ----
# Queremos: añadir la columna cambio a data_trial y calcular su media.
# Qué pasa: da un aviso (warning)

data_trial |>
  mutate(cambio = anxiety_post - anxiety_pre)

mean(data_trial$cambio)

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

## PROBLEMA 6 ----
# Queremos: clasificar la ansiedad después del tratamiento en alta (15 o más),
#   moderada (de 10 a 15) y baja (menos de 10).
# Qué pasa: no da error, pero el resultado no es el que queremos

data_trial <- data_trial |>
  mutate(gravedad_post = case_when(anxiety_post >= 15 ~ "alta",
                                   anxiety_post >= 10 ~ "moderada"))

count(data_trial, gravedad_post)

# ¿Qué falla?
#

# Corrección:
# TU_CODIGO_AQUI

# ==============================================================================
sessionInfo()
