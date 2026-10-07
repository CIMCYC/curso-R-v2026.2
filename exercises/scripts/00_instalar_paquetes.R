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


# --- 1. Lista de paquetes del curso -------------------------------------------
# c() ("combine") junta varios valores en un VECTOR, la estructura más básica
# de R. Aquí juntamos los nombres de los paquetes, entre comillas porque son
# texto. El resultado se guarda con <- en un objeto llamado paquetes_curso.

paquetes_curso <- c(
  "tidyverse",       # importar, transformar y visualizar datos (dias 1-4)
  "palmerpenguins",  # dataset de pinguinos (visualizacion)
  "gapminder",       # dataset de paises (reportes)
  "readxl",          # leer archivos de Excel
  "writexl",         # escribir archivos de Excel
  "haven",           # leer archivos de SPSS (.sav)
  "rio",             # importar/exportar cualquier formato
  "here",            # rutas relativas a la raiz del proyecto (here())
  "janitor",         # limpiar nombres de columnas
  "psych",           # estadistica descriptiva
  "afex",            # ANOVA
  "emmeans",         # comparaciones post-hoc
  "effectsize",      # tamanos del efecto
  "car",             # supuestos del ANOVA
  "easystats",       # report, performance, etc.
  "knitr",           # tablas en informes Quarto
  "tinytex",         # informes en PDF (opcional)
  "pacman"           # instalar y cargar paquetes en una sola linea (p_load)
)


# --- 2. Instalar solo los que faltan ------------------------------------------
# installed.packages() devuelve una tabla con todos los paquetes que ya tienes
# instalados en el ordenador; rownames() saca de esa tabla solo los nombres.
# setdiff(A, B) ("set difference") devuelve lo que está en A pero NO en B:
# es decir, los paquetes de la lista que todavía no tienes.

paquetes_que_faltan <- setdiff(paquetes_curso, rownames(installed.packages()))

# length() cuenta cuántos elementos tiene un vector.
# if (...) { ... } else { ... } es una CONDICIÓN: si lo que hay entre
# paréntesis es verdadero, R ejecuta el primer bloque; si no, el segundo.
# paste() pega trozos de texto; collapse = ", " los separa con comas.
# print() muestra el resultado en la consola.
# install.packages() descarga e instala paquetes desde CRAN, el repositorio
# oficial de R (repos = indica de qué servidor descargarlos).

if (length(paquetes_que_faltan) > 0) {
  print(paste("Instalando:", paste(paquetes_que_faltan, collapse = ", ")))
  install.packages(paquetes_que_faltan, repos = "https://cloud.r-project.org")
} else {
  print("Ya tienes todos los paquetes del curso instalados.")
}


# --- 3. Comprobar que todo esta ----------------------------------------------
# Repetimos la misma comprobación de antes, ahora DESPUÉS de instalar.
# Si algún paquete sigue faltando (p. ej. por un fallo de descarga),
# aparecerá aquí: avisa a Filip

todavia_faltan <- setdiff(paquetes_curso, rownames(installed.packages()))

# == 0 pregunta "¿es igual a cero?" y devuelve TRUE (verdadero) o FALSE (falso).

if (length(todavia_faltan) == 0) {
  print("Todo correcto: todos los paquetes del curso estan instalados.")
} else {
  print(paste("ATENCION, no se han podido instalar:",
              paste(todavia_faltan, collapse = ", ")))
}


# --- 4. (Opcional) Actualizar los paquetes que ya tenias ---------------------
# update.packages() busca en CRAN versiones más nuevas de los paquetes que ya
# tienes y las instala; ask = FALSE hace que no pregunte paquete por paquete.
# Solo si ya tenías paquetes de antes y quieres ponerlos al día.
# Puede tardar bastante: hazlo justo antes de la pausa.
# Quita el # de la línea siguiente para ejecutarla:

# update.packages(ask = FALSE)
