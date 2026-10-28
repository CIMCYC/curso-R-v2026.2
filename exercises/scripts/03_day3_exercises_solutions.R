# ==============================================================================
# EJERCICIOS - DÍA 3 (versión SOLUCIONES)
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

# Solución:

# 1. pivot a formato largo
datos_largo <- datos_ancho |>
  pivot_longer(
    cols      = c(dia_1, dia_2, dia_3),
    names_to  = "dia",
    values_to = "puntuacion"
  )
datos_largo

# 2. número de filas: 3 pacientes x 3 días = 9
nrow(datos_largo)

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

# Solución:

# 1. cargar los datos preprocesados del día 2
datos_preprocesados <- read_csv(
  here("data", "processed_data", "preprocessed_data.csv")
)

# 2-3. seleccionar y pivotar
wellbeing_largo <- datos_preprocesados |>
  select(patient_id, group,
         wellbeing_pre, wellbeing_post, wellbeing_followup) |>
  pivot_longer(
    cols         = starts_with("wellbeing"),
    names_to     = "momento",
    values_to    = "wellbeing",
    names_prefix = "wellbeing_"  # quita el prefijo -> "pre", "post", "followup"
  ) |>
  # factor() ordena los niveles en el orden que queremos
  mutate(momento = factor(momento, levels = c("pre", "post", "followup")))
wellbeing_largo

# 4. número de filas: 300 pacientes x 3 momentos = 900
nrow(wellbeing_largo)

# 5. bonus: media por grupo y momento
medias_wellbeing <- wellbeing_largo |>
  group_by(group, momento) |>
  summarise(
    media = round(mean(wellbeing), 2),
    .groups = "drop"
  )
medias_wellbeing


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

# Solución:

# 1. histograma y QQ plot
hist(x = data_trial$age)
qqnorm(y = data_trial$age)
qqline(y = data_trial$age)

# 2. normalidad de age
shapiro.test(x = data_trial$age)

# 3. age NO es normal (p < 0.05) -> usamos Spearman

# 4. correlación de Spearman
correlacion_edad <- cor.test(
  formula = ~ age + anxiety_post,
  data    = data_trial,
  method  = "spearman"
)
correlacion_edad

# 5. resumen APA
report(x = correlacion_edad)

# 6. diagrama de dispersión
plot(formula = anxiety_post ~ age,
     data = data_trial)

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

# Solución:

# 1. subconjunto
datos_farmaco <- data_trial |>
  filter(group %in% c("pharmacological", "control"))

# 2. descriptivos
descriptivos_farmaco <- datos_farmaco |>
  summarise(n     = n(),
            media = round(mean(anxiety_post), 2),
            sd    = round(sd(anxiety_post), 2),
            .by   = group)
descriptivos_farmaco

# 3. boxplot
boxplot(formula = anxiety_post ~ group,
        data = datos_farmaco)

# 4. supuestos
# un subconjunto por grupo
farmaco_g <- datos_farmaco |>
  filter(group == "pharmacological")
control_g <- datos_farmaco |>
  filter(group == "control")

# histograma y QQ plot de cada grupo
hist(x = farmaco_g$anxiety_post)
qqnorm(y = farmaco_g$anxiety_post)
qqline(y = farmaco_g$anxiety_post)
hist(x = control_g$anxiety_post)
qqnorm(y = control_g$anxiety_post)
qqline(y = control_g$anxiety_post)

# 4a. normalidad dentro de cada grupo
normalidad_farmaco <- datos_farmaco |>
  summarise(
    p_sw = shapiro.test(x = anxiety_post)$p.value,
    .by = group
  )
normalidad_farmaco

# 4b. homogeneidad de varianzas
levene_farmaco <- leveneTest(
  y    = anxiety_post ~ group,
  data = datos_farmaco
)
levene_farmaco

# 5. t-test
resultado_t_farmaco <- t.test(
  formula = anxiety_post ~ group,
  data    = datos_farmaco
)
resultado_t_farmaco

# 6a. tamaño del efecto
efecto_farmaco <- cohens_d(
  x    = anxiety_post ~ group,
  data = datos_farmaco
)
efecto_farmaco

# 6b. resumen APA
report(x = resultado_t_farmaco,
       data = datos_farmaco)


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

# Solución:

# 1. descriptivos
descriptivos_post <- data_trial |>
  summarise(n     = n(),
            media = round(mean(anxiety_post), 2),
            sd    = round(sd(anxiety_post), 2),
            .by   = group)
descriptivos_post

# 2. boxplot
boxplot(formula = anxiety_post ~ group,
        data = data_trial)

# 3. ANOVA de una via (Error(patient_id) identifica a cada paciente)
anova_post <- aov_car(
  formula     = anxiety_post ~ group + Error(patient_id),
  data        = data_trial,
  include_aov = TRUE
)
anova_post

# 4. supuestos: normalidad de los residuos y homogeneidad de varianzas
hist(x = residuals(anova_post))
qqnorm(y = residuals(anova_post))
qqline(y = residuals(anova_post))
shapiro.test(x = residuals(anova_post))
leveneTest(y = anxiety_post ~ group, data = data_trial)

# 5. el efecto de group ES significativo (p < .001): post-hoc con Holm
medias_post <- emmeans(object = anova_post, specs = ~ group)
pairs(x = medias_post, adjust = "holm")

# 6a. tamano del efecto
eta_squared(model = anova_post)

# 6b. resumen APA (report() usa el aov interno del modelo)
report(x = anova_post$aov)


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

# Solución:

# 1. datos preprocesados (con el seguimiento)
datos_preprocesados <- read_csv(
  here("data", "processed_data", "preprocessed_data.csv")
)

# 2. formato largo con tres momentos
datos_largo3 <- datos_preprocesados |>
  select(patient_id, group, anxiety_pre, anxiety_post, anxiety_followup) |>
  pivot_longer(
    cols         = starts_with("anxiety"),
    names_to     = "momento",
    values_to    = "anxiety",
    names_prefix = "anxiety_"
  ) |>
  mutate(momento = factor(momento, levels = c("pre", "post", "followup")))

# 300 pacientes x 3 momentos = 900 filas
nrow(datos_largo3)

# 3. descriptivos por grupo y momento
descriptivos_3 <- datos_largo3 |>
  summarise(media = round(mean(anxiety), 2),
            sd    = round(sd(anxiety), 2),
            .by   = c(group, momento))
descriptivos_3

# 4. ANOVA mixto: los df de momento (1.69, 501.82) ya no son enteros:
#    aov_car() ha aplicado la correccion de Greenhouse-Geisser
anova_mixto3 <- aov_car(
  formula = anxiety ~ group * momento + Error(patient_id/momento),
  data    = datos_largo3
)
anova_mixto3

# 5. grafico de interaccion
emmip(object = anova_mixto3, formula = group ~ momento, CIs = TRUE)

# 6. efectos simples: momentos dentro de cada grupo (Holm)
cambio_por_grupo3 <- emmeans(object = anova_mixto3, specs = ~ momento | group)
pairs(x = cambio_por_grupo3, adjust = "holm")

# Interpretacion:
# - CBT: pre - followup = 3.4 puntos (p < .001): mantiene la mayor parte de la
#   mejora, aunque sube 0.9 puntos de post a followup
# - Farmacologico: pre - followup = 0.25 (p = .25): a los 3 meses ha vuelto al
#   nivel inicial
# - Control: cambios pequenos (menos de 1 punto)

# ==============================================================================
sessionInfo()
