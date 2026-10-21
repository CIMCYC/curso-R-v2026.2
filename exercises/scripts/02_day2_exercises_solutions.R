# ==============================================================================
# EJERCICIOS - DÍA 2 (versión SOLUCIONES)
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

library(tidyverse)   # read_csv(), select(), filter(), mutate(), ...
library(here)        # rutas desde la raíz del proyecto: here("data", "raw_data", ...)


# ==============================================================================
# BLOQUE 1: tidyverse, el pipe, organizar proyectos, select() y filter()
# ==============================================================================

## EJERCICIO 1: abrir el proyecto ----
# Tiempo: 5 minutos

# 1. Abre RStudio con doble clic en `exercises/exercises.Rproj`
# 2. Abre el script `scripts/02_day2_exercises_student.R` (este archivo)
# 3. Comprueba la raíz con `here()`: ¿es tu carpeta `exercises/`?

# Solución:

# la raíz del proyecto (debe terminar en /exercises)
here()

## EJERCICIO 2: convertir código anidado a pipe ----
# Tiempo: 5 minutos

# Reescribe estos fragmentos usando el pipe `|>`:
# 1. round(mean(c(12, 18, 7, 25, 14)), 1)
# 2. sqrt(sum(c(1, 4, 9, 16)))
# 3. length(unique(c("a", "b", "a", "c", "b", "a")))

# Solución:

# 1.
c(12, 18, 7, 25, 14) |>
  mean() |>
  round(1)

# 2.
c(1, 4, 9, 16) |>
  sum() |>
  sqrt()

# 3.
c("a", "b", "a", "c", "b", "a") |>
  unique() |>
  length()

## EJERCICIO 3: cargar data_clinical_trial y data_sites ----
# Tiempo: 5 minutos

# 1. Carga el ensayo:
#    data_trial <- read_csv(here("data", "raw_data", "data_clinical_trial.csv"))
# 2. Explóralo: `glimpse(data_trial)`, `head(data_trial)`, `View(data_trial)`
# 3. Carga `data_sites.csv` con `read_csv()` y `here()` (está en `data/raw_data/`)
# 4. Guárdalo en un objeto llamado `sites`
# 5. Explora con `glimpse(sites)`: ¿cuántas filas y columnas tiene?
# 6. Usa `View(sites)` para ver los datos visualmente (alternativamente, haz
#    clic en los datos en el panel Environment)

# Solución:

# 1-2. el ensayo
data_trial <- read_csv(here("data", "raw_data", "data_clinical_trial.csv"))
glimpse(data_trial)
head(data_trial)
# View(data_trial)   # abre el visor de datos en RStudio

# 3-6. los centros
sites <- read_csv(here("data", "raw_data", "data_sites.csv"))
glimpse(sites)
# View(sites)

## EJERCICIO 4: rename() + relocate() ----
# Tiempo: 5 minutos

# Los nombres `rosenberg_pre` y `ucla_pre` no son muy intuitivos. Encadena estos
# pasos con `|>` sobre `data_trial`:
# 1. Renombra `rosenberg_pre` a `self_esteem_pre` y `rosenberg_post` a
#    `self_esteem_post`
# 2. Renombra `ucla_pre` a `loneliness_pre` y `ucla_post` a `loneliness_post`
# 3. Mueve `n_sessions` justo después de `group`
# 4. Guarda el resultado en `data_trial_renamed`

# Solución:

data_trial_renamed <- data_trial |>
  rename(
    self_esteem_pre  = rosenberg_pre,
    self_esteem_post = rosenberg_post,
    loneliness_pre   = ucla_pre,
    loneliness_post  = ucla_post
  ) |>
  relocate(n_sessions, .after = group)
head(data_trial_renamed)

## EJERCICIO 5: explorar y filtrar el ensayo ----
# Tiempo: 10 minutos

# Usando el dataset `data_trial`:
# 1. Usa `glimpse()` para ver la estructura del dataset
# 2. ¿Cuántos pacientes hay en cada grupo? (usa `table()`)
# 3. Filtra los pacientes del grupo "pharmacological" con `anxiety_pre` mayor
#    que 10
# 4. Del resultado anterior, selecciona solo las columnas `patient_id`, `sex`,
#    `age`, `anxiety_pre` y `anxiety_post`
# 5. Guarda el resultado en un objeto llamado `pharm_anxiety_alta`
# 6. ¿Cuántas filas tiene el resultado? (usa `nrow()`)
#
# Plantilla (quita los # y completa):
# glimpse(TU_CODIGO_AQUI)
# table(TU_CODIGO_AQUI)
# pharm_anxiety_alta <- data_trial |>
#   filter(TU_CODIGO_AQUI) |>
#   select(TU_CODIGO_AQUI)

# Solución:

# 1. explorar los datos
glimpse(data_trial)

# 2. pacientes por grupo
table(data_trial$group)

# 3-5. filtrar, seleccionar y guardar
pharm_anxiety_alta <- data_trial |>
  filter(group == "pharmacological", anxiety_pre > 10) |>
  select(patient_id, sex, age, anxiety_pre, anxiety_post)
pharm_anxiety_alta

# 6. cuántas filas?
nrow(pharm_anxiety_alta)


# ==============================================================================
# BLOQUE 2: arrange(), mutate(), condicionales, combinar y unir tablas
# ==============================================================================

## EJERCICIO 6: ordenar pacientes ----
# Tiempo: 5 minutos

# 1. Ordena `data_trial` por `wellbeing_pre` de mayor a menor.
# 2. Muestra solo las columnas `patient_id`, `group`, `wellbeing_pre`.
# 3. ¿Qué paciente tiene el bienestar más alto?
# 4. Guarda el resultado en un objeto.

# Solución:

pacientes_bienestar <- data_trial |>
  arrange(desc(wellbeing_pre)) |>
  select(patient_id, group, wellbeing_pre)
pacientes_bienestar   # el primero es el paciente con mayor bienestar

## EJERCICIO 7: if_else() ----
# Tiempo: 5 minutos

# Usa `if_else()` para crear una nueva columna `grupo_edad` en `data_trial`:
#   - Si `age >= 60` -> "senior"
#   - Si no -> "junior"
# Después, cuenta cuántos pacientes hay en cada categoría con `count()`.

# Solución:

datos_grupo_edad <- data_trial |>
  mutate(grupo_edad = if_else(age >= 60, "senior", "junior"))
datos_grupo_edad |> count(grupo_edad)

## EJERCICIO 8: clasificar la gravedad de la depresión ----
# Tiempo: 7 minutos

# Crea una columna `gravedad_depresion` en `data_trial` usando `case_when()`
# basada en `depression_pre` (PHQ-9, rango 0-27):
#   - <= 4  -> "minima"
#   - <= 9  -> "leve"
#   - <= 14 -> "moderada"
#   - <= 19 -> "moderadamente_grave"
#   - resto -> "grave"
# Guarda el resultado y usa `count()` para ver cuántos pacientes hay en cada
# categoría.

# Solución:

datos_gravedad <- data_trial |>
  mutate(gravedad_depresion = case_when(
    depression_pre <= 4  ~ "minima",
    depression_pre <= 9  ~ "leve",
    depression_pre <= 14 ~ "moderada",
    depression_pre <= 19 ~ "moderadamente_grave",
    .default             = "grave"
  ))
datos_gravedad |> count(gravedad_depresion)

## EJERCICIO 9: unir, clasificar y comparar ----
# Tiempo: 20 minutos

# 1. Carga los datos de seguimiento:
#    data_followup <- read_csv(here("data", "raw_data", "data_clinical_trial_followup.csv"))
# 2. Haz un `left_join()` de `data_trial` con `data_followup` por `patient_id`
# 3. Clasifica la gravedad de ansiedad en pre, post y followup con
#    `case_when()` (GAD-7: <= 4 mínima, <= 9 leve, <= 14 moderada, resto grave)
# 4. Cuenta el número de pacientes en cada categoría de gravedad para cada
#    momento (`count()`)
# 5. Crea columnas de mejora (`anxiety_pre - anxiety_post`) y mantenimiento
#    (`anxiety_post - anxiety_followup`) con `mutate()`
# 6. Guarda el resultado en `datos_clasificados`

# Solución:

# 1. datos de seguimiento
data_followup <- read_csv(here("data", "raw_data", "data_clinical_trial_followup.csv"))

# 2-3 y 5-6. unir, clasificar y crear mejora / mantenimiento
datos_clasificados <- data_trial |>
  left_join(data_followup, by = "patient_id") |>
  mutate(
    gravedad_pre = case_when(
      anxiety_pre <= 4  ~ "minima",
      anxiety_pre <= 9  ~ "leve",
      anxiety_pre <= 14 ~ "moderada",
      .default          = "grave"
    ),
    gravedad_post = case_when(
      anxiety_post <= 4  ~ "minima",
      anxiety_post <= 9  ~ "leve",
      anxiety_post <= 14 ~ "moderada",
      .default           = "grave"
    ),
    gravedad_followup = case_when(
      anxiety_followup <= 4  ~ "minima",
      anxiety_followup <= 9  ~ "leve",
      anxiety_followup <= 14 ~ "moderada",
      .default               = "grave"
    ),
    mejora        = anxiety_pre - anxiety_post,
    mantenimiento = anxiety_post - anxiety_followup
  )
datos_clasificados

# 4. pacientes por gravedad en cada momento
datos_clasificados |> count(gravedad_pre)
datos_clasificados |> count(gravedad_post)
datos_clasificados |> count(gravedad_followup)


# ==============================================================================
# BLOQUE 3: group_by() + summarise(), pipelines completos, guardar los datos
# ==============================================================================

## EJERCICIO 10: practicar group_by() + summarise() ----
# Tiempo: 10 minutos

# 1. Empieza con la sesión limpia: reinicia R con Session -> Restart R
#    (Ctrl/Cmd + Shift + F10)
# 2. Carga los paquetes necesarios
# 3. Carga los datos (`data_trial`, `data_followup`)
# 4. Crea una columna `cambio` = `depression_pre - depression_post` con
#    `mutate()`
# 5. Agrupa por grupo y sexo con `group_by()`
# 6. Con `summarise()`, calcula la media de `depression_pre`,
#    `depression_post` y `cambio`, y el número de pacientes (`n()`)
# 7. Ordena el resultado de mayor a menor cambio medio con `arrange(desc())`.
#    ¿Qué combinación muestra mayor cambio?

# Solución:

# 1. Session -> Restart R (Ctrl/Cmd + Shift + F10)
# 2. paquetes: los de la cabecera de este script
# 3. datos
data_trial    <- read_csv(here("data", "raw_data", "data_clinical_trial.csv"))
data_followup <- read_csv(here("data", "raw_data", "data_clinical_trial_followup.csv"))

# 4-7. depresión pre y post por grupo y sexo, ordenado por cambio medio
resumen_depresion <- data_trial |>
  mutate(cambio = depression_pre - depression_post) |>
  group_by(group, sex) |>
  summarise(
    media_pre    = mean(depression_pre, na.rm = TRUE),
    media_post   = mean(depression_post, na.rm = TRUE),
    media_cambio = mean(cambio, na.rm = TRUE),
    n            = n(),
    .groups      = "drop"
  ) |>
  arrange(desc(media_cambio))
resumen_depresion   # la primera fila es la combinación con mayor cambio

## EJERCICIO 11: preparar los datos y construir la Tabla 1 ----
# Tiempo: 20 minutos

# Los datos ya están cargados. El objetivo es la Tabla 1 del principio del
# bloque y el archivo con el que trabajaremos el día 3:
# 1. Une `data_trial` con `data_followup` por `patient_id` (`left_join()`) y
#    guarda el resultado en `datos_preprocesados`
# 2. Guarda `datos_preprocesados` en `data/processed_data/preprocessed_data.csv`
#    con `write_csv()` y `here()`: los análisis del día 3 parten de este archivo
# 3. Construye la Tabla 1: agrupa por `group` y calcula `n()` y la media y la
#    DT de `anxiety_pre`, `anxiety_post` y `anxiety_followup`
#    (con `.groups = "drop"`)
# 4. Redondea las medias y las DT a 1 decimal con `round()`

# Solución:

# 1. unir el ensayo con el seguimiento
datos_preprocesados <- data_trial |>
  left_join(data_followup, by = "patient_id")

# 2. guardar los datos para el día 3
write_csv(datos_preprocesados,
          here("data", "processed_data", "preprocessed_data.csv"))

# 3-4. la Tabla 1: n, media y DT por grupo y momento
tabla_1 <- datos_preprocesados |>
  group_by(group) |>
  summarise(
    n              = n(),
    media_pre      = round(mean(anxiety_pre, na.rm = TRUE), 1),
    dt_pre         = round(sd(anxiety_pre, na.rm = TRUE), 1),
    media_post     = round(mean(anxiety_post, na.rm = TRUE), 1),
    dt_post        = round(sd(anxiety_post, na.rm = TRUE), 1),
    media_followup = round(mean(anxiety_followup, na.rm = TRUE), 1),
    dt_followup    = round(sd(anxiety_followup, na.rm = TRUE), 1),
    .groups        = "drop"
  )
tabla_1

## EJERCICIO 11 - si te sobra tiempo ----

# Sobre `datos_preprocesados` (sin cambiar el archivo del paso 2):
# 1. Crea `mejora_pre_post = anxiety_pre - anxiety_post` y
#    `mejora_pre_followup = anxiety_pre - anxiety_followup`, y guarda el
#    resultado en `datos_mejora`
# 2. Clasifica cada mejora con `if_else()` ("mejora" si es mayor que 0,
#    "empeora" si no) en dos columnas: `cambio_pre_post` y
#    `cambio_pre_followup`
# 3. Cuenta cuántos pacientes mejoran y cuántos empeoran por grupo (`count()`),
#    para cada una de las dos columnas

# Solución:

datos_mejora <- datos_preprocesados |>
  mutate(
    mejora_pre_post     = anxiety_pre - anxiety_post,
    mejora_pre_followup = anxiety_pre - anxiety_followup,
    cambio_pre_post     = if_else(mejora_pre_post > 0, "mejora", "empeora"),
    cambio_pre_followup = if_else(mejora_pre_followup > 0, "mejora", "empeora")
  )
datos_mejora |> count(group, cambio_pre_post)
datos_mejora |> count(group, cambio_pre_followup)

# ==============================================================================
sessionInfo()
