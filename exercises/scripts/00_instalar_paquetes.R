# ==============================================================================
# 00_instalar_paquetes.R
# Curso: Introducción a la programación y análisis de datos en R (v2026.2)
# Filip Andras - CIMCYC, Universidad de Granada
#
# Instala los paquetes que usaremos en el curso.
# Solo instala los que te FALTEN: si ya los tienes, no los toca.
# Ejecútalo entero: Source (Ctrl/Cmd + Shift + Enter). Tarda unos minutos.
#
# NO hace falta que entiendas el código todavía. Cada paso lleva una
# explicación por si tienes curiosidad; lo iremos viendo durante el curso.
#
# Las líneas que empiezan por # son COMENTARIOS: R las ignora. Sirven para
# explicar el código a las personas que lo leen (incluido tu yo del futuro).
# ==============================================================================


# --- 1. Servidor de descarga --------------------------------------------------
# Los paquetes se descargan de CRAN, el repositorio oficial de R. options()
# cambia un ajuste de R: aquí le decimos de qué servidor de CRAN descargarlos.

options(repos = c(CRAN = "https://cloud.r-project.org"))


# --- 2. El paquete pacman -----------------------------------------------------
# pacman es un paquete para instalar y cargar otros paquetes en un solo paso.
# require() intenta cargar un paquete y devuelve TRUE si lo consigue o FALSE si
# no lo tienes instalado. El signo ! significa "NO": !require("pacman") es TRUE
# cuando pacman NO está instalado, y solo entonces se ejecuta install.packages().

if (!require("pacman")) install.packages("pacman")


# --- 3. Lista de paquetes del curso -------------------------------------------
# c() ("combine") junta varios valores en un VECTOR, la estructura más básica
# de R. Aquí juntamos los nombres de los paquetes, entre comillas porque son
# texto. El resultado se guarda con <- en un objeto llamado paquetes_curso.

paquetes_curso <- c(
  "tidyverse",       # importar, transformar y visualizar datos (días 1-4)
  "palmerpenguins",  # dataset de pingüinos (visualización)
  "gapminder",       # dataset de países (reportes)
  "readxl",          # leer archivos de Excel
  "writexl",         # escribir archivos de Excel
  "haven",           # leer archivos de SPSS (.sav)
  "rio",             # importar/exportar cualquier formato
  "here",            # rutas relativas a la raíz del proyecto (here())
  "janitor",         # limpiar nombres de columnas
  "psych",           # estadística descriptiva
  "corrplot",        # matriz de correlaciones en un mapa de calor
  "sjPlot",          # tablas listas para un artículo (tab_corr)
  "afex",            # ANOVA
  "emmeans",         # comparaciones post-hoc
  "effectsize",      # tamaños del efecto
  "car",             # supuestos del ANOVA
  "easystats",       # report, performance, etc.
  "knitr",           # tablas en informes Quarto
  "tinytex"          # informes en PDF (opcional)
)


# --- 4. Instalar los que faltan y comprobar que funcionan ---------------------
# pacman::p_load() hace dos cosas con cada paquete de la lista: si no lo tienes,
# lo instala; después lo carga, que es la prueba de que funciona.
# El argumento char = sirve para darle los nombres dentro de un vector.
# Devuelve TRUE o FALSE para cada paquete: TRUE si ha quedado cargado.
# Lo guardamos en un objeto llamado cargados.

cargados <- pacman::p_load(char = paquetes_curso)


# --- 5. Resultado -------------------------------------------------------------
# cargados[!cargados] se queda con los paquetes que han dado FALSE.
# names() saca sus nombres. length() cuenta cuántos hay.
# if (...) { ... } else { ... } es una CONDICIÓN: si lo que hay entre
# paréntesis es verdadero, R ejecuta el primer bloque; si no, el segundo.
# paste() pega trozos de texto; collapse = ", " los separa con comas.
# Si sale ATENCION, avisa a Filip.

no_cargados <- names(cargados[!cargados])

if (length(no_cargados) == 0) {
  print("Todo correcto: todos los paquetes del curso estan instalados y funcionan.")
} else {
  print(paste("ATENCION, no se han podido instalar o cargar:",
              paste(no_cargados, collapse = ", ")))
}

# Al terminar, reinicia R para empezar el día con la sesión limpia:
# Session -> Restart R (Ctrl/Cmd + Shift + F10).


# --- 6. (Opcional) Actualizar los paquetes que ya tenías ---------------------
# update.packages() busca en CRAN versiones más nuevas de los paquetes que ya
# tienes y las instala; ask = FALSE hace que no pregunte paquete por paquete.
# Solo si ya tenías paquetes de antes y quieres ponerlos al día.
# Puede tardar bastante: hazlo justo antes de la pausa.
# Quita el # de la línea siguiente para ejecutarla:

# update.packages(ask = FALSE)
