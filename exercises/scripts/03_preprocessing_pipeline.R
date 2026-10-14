# ==============================================================================
# PIPELINE DE PREPROCESAMIENTO - DÍA 3
# Curso: Introducción a la programación y análisis de datos en R (v2026.2)
# Filip Andras - CIMCYC, Universidad de Granada
#
# Ejecuta este script si no completaste el Ejercicio 11 del día 2 y necesitas
# los datos preprocesados (data/processed_data/preprocessed_data.csv) para
# continuar con los ejercicios del día 3. Hace exactamente lo mismo que la
# solución de ese ejercicio.
# ==============================================================================

# --- Paquetes -----------------------------------------------------------------
# Instalar solo la primera vez (quita el # para ejecutarlo):
# install.packages(c("tidyverse", "here"))

library(tidyverse)   # read_csv(), left_join(), write_csv(), ...
library(here)        # rutas desde la raíz del proyecto: here("data", "raw_data", ...)

# --- Cargar los datos ---------------------------------------------------------
data_trial    <- read_csv(here("data", "raw_data", "data_clinical_trial.csv"))
data_followup <- read_csv(here("data", "raw_data", "data_clinical_trial_followup.csv"))

# --- Unir el ensayo con el seguimiento ----------------------------------------
datos_preprocesados <- data_trial |>
  left_join(data_followup, by = "patient_id")

# --- Guardar ------------------------------------------------------------------
write_csv(datos_preprocesados,
          here("data", "processed_data", "preprocessed_data.csv"))

print(paste("Filas:", nrow(datos_preprocesados), "| Columnas:", ncol(datos_preprocesados)))
print("Datos guardados en data/processed_data/preprocessed_data.csv")
