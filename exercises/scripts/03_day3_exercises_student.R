# ==============================================================================
# EJERCICIOS - DÍA 3 (versión ESTUDIANTE)
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
# install.packages(c("tidyverse", "here", "car", "effectsize", "report", "afex", "emmeans"))

library(tidyverse)   # read_csv(), select(), filter(), pivot_longer(), ...
library(here)        # rutas desde la raíz del proyecto: here("data", "raw_data", ...)
library(car)         # leveneTest()
library(effectsize)  # cohens_d(), eta_squared()
library(report)      # report() (parte de easystats)
library(afex)        # aov_car()
library(emmeans)     # emmeans(), pairs()

# --- Datos --------------------------------------------------------------------
data_trial <- read_csv(here("data", "raw_data", "data_clinical_trial.csv"))


# ==============================================================================
# BLOQUE 1: datos anchos y largos: pivot_longer() / pivot_wider()
# ==============================================================================

## EJERCICIO 1: tu primer pivot_longer() ----
# Tiempo: 5 minutos

# Tienes este tibble en formato ancho (ejecútalo tal cual):

datos_ancho <- tibble(
  paciente = 1:3,
  dia_1    = c(10, 8, 12),
  dia_2    = c(7, 6, 9),
  dia_3    = c(5, 4, 7)
)

# 1. Usa `pivot_longer()` para convertirlo a formato largo: las columnas
#    `dia_*` se apilan en una sola columna llamada `dia` y los valores en
#    una columna llamada `puntuacion`.
# 2. ¿Cuántas filas tiene el resultado?

# TU_CODIGO_AQUI

## EJERCICIO 2: reestructurar datos de bienestar con seguimiento ----
# Tiempo: 20 minutos

# Usamos los datos preprocesados que guardamos el día 2
# (`data/processed_data/preprocessed_data.csv`):

# 1. Carga los datos preprocesados con `read_csv()` y `here()`
# 2. Selecciona `patient_id`, `group`, `wellbeing_pre`, `wellbeing_post`,
#    `wellbeing_followup`
# 3. Usa `pivot_longer()` para crear el formato largo (columnas: `momento`
#    y `wellbeing`)
# 4. ¿Cuántas filas tiene el resultado?
# 5. Bonus: calcula la media de `wellbeing` por `group` y `momento`

# TU_CODIGO_AQUI


# ==============================================================================
# BLOQUE 2: la fórmula en R, correlación y t-test
# ==============================================================================

## EJERCICIO 3: correlación entre edad y ansiedad ----
# Tiempo: 8 minutos

# Sobre `data_trial`:

# 1. Visualiza la distribución de `age` con un histograma (`hist()`) y un
#    QQ plot (`qqnorm()` + `qqline()`)
# 2. Comprueba la normalidad de `age` con `shapiro.test()`
# 3. ¿Es normal? ¿Qué tipo de correlación debemos usar?
# 4. Calcula la correlación entre `age` y `anxiety_post` con `cor.test()` y la
#    fórmula `~ age + anxiety_post`, usando el método adecuado
# 5. Genera el resumen APA con `report()`
# 6. Visualiza la relación con `plot()` y la fórmula `anxiety_post ~ age`

# TU_CODIGO_AQUI

## EJERCICIO 4: farmacológico frente a control ----
# Tiempo: 12 minutos

# Mismos grupos que en clase, ahora DESPUÉS del tratamiento: ¿difiere la
# ansiedad post entre el grupo farmacológico y el control?

# 1. Crea `datos_farmaco` con solo los grupos "pharmacological" y "control"
# 2. Calcula n, media y desviación típica de `anxiety_post` por grupo
# 3. Visualiza con `boxplot()` y la fórmula `anxiety_post ~ group`
# 4. Comprueba los supuestos: histograma y QQ plot de cada grupo,
#    `shapiro.test()` (por grupo) y `leveneTest()`
# 5. Haz el t-test con `t.test()`
# 6. Calcula el tamaño del efecto con `cohens_d()` y genera el resumen con
#    `report()`

# TU_CODIGO_AQUI


# ==============================================================================
# BLOQUE 3: ANOVA de una vía y ANOVA mixto
# ==============================================================================

## EJERCICIO 5: ANOVA de una vía después del tratamiento ----
# Tiempo: 12 minutos

# Mismo flujo que el ANOVA basal de clase, ahora con `anxiety_post`:
# ¿difieren los tres grupos DESPUÉS del tratamiento?

# 1. Calcula n, media y desviación típica de `anxiety_post` por grupo
# 2. Visualiza con `boxplot()` y la fórmula `anxiety_post ~ group`
# 3. Ajusta el ANOVA con `aov_car()` (fórmula `anxiety_post ~ group +
#    Error(patient_id)`, `include_aov = TRUE`) y guárdalo en `anova_post`
# 4. Comprueba los supuestos: histograma y QQ plot de los residuos,
#    `shapiro.test()` de los residuos y `leveneTest()`
# 5. Mira la tabla: ¿es significativo el efecto de `group`? Si lo es, haz las
#    comparaciones post-hoc con `emmeans()` + `pairs()` (corrección de Holm)
# 6. Calcula el tamaño del efecto con `eta_squared()` y genera el resumen con
#    `report()` sobre `anova_post$aov`

# TU_CODIGO_AQUI


# ==============================================================================
# PARA CASA: ANOVA mixto con el seguimiento
# ==============================================================================

## EJERCICIO 6 (para casa): ANOVA mixto con el seguimiento a 3 meses ----
# Tiempo: 30 minutos

# En clase ignoramos el seguimiento. Repite el ANOVA mixto con los TRES momentos
# (pre, post, followup): ¿se mantiene la mejora a los 3 meses?

# 1. Carga `data/processed_data/preprocessed_data.csv` (tiene `anxiety_followup`)
#    con `read_csv()` y `here()`
# 2. Pivota `anxiety_pre`, `anxiety_post` y `anxiety_followup` a formato largo
#    (columnas `momento` y `anxiety`); convierte `momento` en factor con los
#    niveles en orden: pre, post, followup
# 3. Calcula media y desviación típica de `anxiety` por `group` y `momento`
# 4. Ajusta el ANOVA mixto con `aov_car()`: fórmula
#    `anxiety ~ group * momento + Error(patient_id/momento)`. Mira los df de
#    `momento`: ya no son enteros porque, con tres niveles, `aov_car()` aplica la
#    corrección de Greenhouse-Geisser (esfericidad)
# 5. Dibuja el gráfico de interacción con `emmip()`
# 6. Efectos simples: compara los momentos dentro de cada grupo con `emmeans()`
#    + `pairs()` (Holm). ¿Qué grupo mantiene la mejora a los 3 meses y cuál
#    vuelve al nivel inicial?

# TU_CODIGO_AQUI

# ==============================================================================
sessionInfo()
