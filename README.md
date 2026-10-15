# Introducción a la programación y análisis de datos en R

**Curso de formación del CIMCYC** para investigadores del centro ([página web del curso](https://cimcyc.ugr.es/formacion/portal-formacion/curso-r-v2026-2))  
**Autor:** Filip Andras — CIMCYC, Universidad de Granada  
**Edición:** octubre de 2026  
**Duración:** 20 horas presenciales, en 4 sesiones: viernes 9, 16, 23 y 30 de octubre de 2026

---

## Estructura del curso

Cada sesión tiene **3 bloques**: 9:00–10:30, 11:00–12:30 y 13:00–14:00.

| Sesión | Tema |
|--------|------|
| **Día 1** (9 oct) | Introducción a la programación en R y RStudio |
| **Día 2** (16 oct) | Procesamiento de datos con tidyverse |
| **Día 3** (23 oct) | Análisis de datos: correlación, *t*-test, ANOVA |
| **Día 4** (30 oct) | Visualización de datos y reportes de investigación |

---

## Contenido por bloque

### Día 1 — Introducción a la programación en R y RStudio
- **Bloque 1:** Bienvenida, R y RStudio, primer script
- **Bloque 2:** R como calculadora, variables, tipos de datos, vectores, `NA` e indexación
- **Bloque 3:** Data frames, leer datos, exploración inicial

### Día 2 — Procesamiento de datos con tidyverse
- **Bloque 1:** Tidyverse, el pipe (`|>`), organizar proyectos, `select()` y `filter()`
- **Bloque 2:** `arrange()`, `mutate()`, `if_else()`, `case_when()`, combinar y unir tablas
- **Bloque 3:** `group_by()` + `summarise()`, pipelines completos, guardar los datos procesados

### Día 3 — Análisis de datos
- **Bloque 1:** Datos anchos y largos: `pivot_longer()` / `pivot_wider()`; repaso de descriptivos
- **Bloque 2:** La fórmula en R (`VD ~ VI`), correlación (`cor.test()`), *t*-test (`t.test()`)
- **Bloque 3:** ANOVA mixto

### Día 4 — Visualización de datos y reportes de investigación
- **Bloque 1:** Visualización de datos con ggplot2: la gramática de gráficos, un gráfico paso a paso, temas y paletas, `facet_wrap()`, `patchwork`, raincloud plots, `ggsave()`
- **Bloque 2:** Reportes reproducibles con Quarto: YAML, chunks, Markdown, código en línea, tablas y figuras numeradas, bibliografía, salida a HTML y Word
- **Bloque 3:** Ejercicio final (el informe del ensayo clínico en Quarto); comentarios, preguntas y siguientes pasos

---

## Lo que aprenderás en el curso

Al terminar el curso sabrás:

- Trabajar con **R y RStudio** de forma organizada: proyectos, scripts, paquetes y rutas con `here()`
- Manejar los **tipos de datos** de R: vectores, valores ausentes (`NA`), indexación y data frames
- **Importar** datos y hacer una primera exploración
- **Transformar** datos con tidyverse: el pipe (`|>`), `select()`, `filter()`, `arrange()`, `mutate()`, condicionales, uniones de tablas y resúmenes por grupo con `group_by()` + `summarise()`
- **Reestructurar** datos entre formato ancho y largo, y guardar los datos procesados
- **Analizar** datos con la fórmula de R (`VD ~ VI`): correlación, *t*-test y ANOVA mixto, comprobando los supuestos, calculando el tamaño del efecto e interpretando y reportando los resultados
- **Visualizar** datos con ggplot2
- Crear **informes reproducibles** con Quarto

---

## Qué no cubre el curso

Es un curso de **introducción**. No enseña:

- **Estadística desde cero**: para seguir el curso hacen falta conocimientos básicos de estadística
- **ANOVA de una vía y ANOVA de medidas repetidas** como análisis completos: se presentan, pero el análisis que se hace paso a paso es el ANOVA mixto
- **Regresión**: lineal (`lm()`), logística y otros modelos lineales generalizados (`glm()`)
- **Modelos mixtos / multinivel** (`lme4`), **estadística bayesiana**, **análisis de potencia**, **ecuaciones estructurales (SEM)** ni **análisis factorial**
- **Pruebas no paramétricas** aparte de la correlación de Spearman (Mann-Whitney, Wilcoxon, Kruskal-Wallis) ni **chi-cuadrado** para variables categóricas
- **Programación más allá de lo básico**: escribir funciones propias, bucles e iteración (`for`, `map()`, `across()`), texto (`stringr`) y fechas (`lubridate`)

Las lecturas recomendadas son un buen punto de partida para seguir aprendiendo.

---

## Presentaciones para estudiantes

Cada bloque tiene una versión para estudiantes, **sin las diapositivas de solución** de los ejercicios: `slides/DayX_bloqueY_student.html`.

| Día | Presentaciones |
|-----|----------------|
| Día 1 | `Day1_bloque1_student.html`, `Day1_bloque2_student.html`, `Day1_bloque3_student.html` |
| Día 2 | `Day2_bloque1_student.html`, `Day2_bloque2_student.html`, `Day2_bloque3_student.html` |
| Día 3 | `Day3_bloque1_student.html`, `Day3_bloque2_student.html`, `Day3_bloque3_student.html` |
| Día 4 | `Day4_bloque1_student.html`, `Day4_bloque2_student.html` |

Los archivos `.html` se abren directamente en el navegador (doble clic) y no necesitan conexión.

---

## Estructura de carpetas

```
.
├── README.md                      Este documento
├── R_best_practices_ES.html       Buenas prácticas de programación en R
├── referencias.md                 Referencias y recursos recomendados
│
├── slides/                        Presentaciones
│   └── DayX_bloqueY_student.html  Versión estudiante (sin soluciones)
│
├── extra/                         Documentos para profundizar (t-test y ANOVA paso a paso)
│
└── exercises/                     Ejercicios en clase
    ├── exercises.Rproj            Proyecto RStudio
    ├── data/
    │   ├── raw_data/              Datos originales (solo lectura)
    │   └── processed_data/        Datos preprocesados
    ├── output/                    Figuras guardadas con ggsave() (día 4)
    └── scripts/                   Scripts de ejercicios (.R) y documentos Quarto (.qmd, día 4)
```

### Material del día 4

En `exercises/scripts/`:

- `04_day4_bloque1_student.qmd`: el código de las diapositivas del bloque 1 (ggplot2), para ir ejecutándolo en clase, con el Ejercicio 1 al final
- `04_day4_bloque2_student.qmd`: el esqueleto del informe del ensayo clínico (Ejercicio 3, final), con las instrucciones de cada apartado en el propio documento. Se escribe en inglés y se renderiza a HTML y a Word
- `04_day4_bloque2_solutions.html` y `04_day4_bloque2_solutions.docx`: el informe terminado, el resultado a reproducir (el `.qmd` de la solución se publica después de la sesión)
- `references.bib` y `apa.csl`: la bibliografía del informe y el estilo de citas APA

En `exercises/data/raw_data/`, `data_clinical_trial_replication.csv` es una "replicación" del ensayo con otros pacientes y otros resultados: sirve para ver cómo el informe se actualiza solo al cambiar el fichero de datos.

---

## Datos

El curso utiliza un **ensayo clínico sintético** como hilo conductor:

- 300 pacientes asignados aleatoriamente a 3 grupos: **CBT (terapia cognitivo-conductual)**, **farmacológico**, **control**
- Variables: ansiedad (GAD-7), depresión (PHQ-9), bienestar, soledad (UCLA), autoestima (Rosenberg)
- Medidas pre-tratamiento, post-tratamiento y seguimiento (followup) a 3 meses

Los datos están en `exercises/data/raw_data/`.

---

## Lecturas recomendadas

- ***R for Data Science*** (2.ª ed.), de Hadley Wickham, Mine Çetinkaya-Rundel y Garrett Grolemund: libro gratuito en línea sobre importar, transformar y visualizar datos con tidyverse — <https://r4ds.hadley.nz/>
- ***Learning Statistics with R***, de Danielle Navarro: introducción a la estadística con R para estudiantes de psicología y principiantes — <https://learningstatisticswithr.com/>

Para practicar más **R base**, si te apetece:

- ***fasteR: Fast Lane to Learning R!***, de Norm Matloff: tutorial gratuito de R base en lecciones cortas con ejercicios, pensado para quien empieza desde cero — <https://github.com/matloff/fasteR>

---

## Materiales complementarios

| Archivo | Descripción |
|---------|-------------|
| `R_best_practices_ES.html` | Buenas prácticas de programación en R |
| `referencias.md` | Referencias, recursos y enlaces recomendados |
| `extra/ttest_by_hand.html` | *El t-test paso a paso: de Student a R* |
| `extra/anova_by_hand.html` | *ANOVA paso a paso: de Fisher a R* |

---

## Para aprovechar el curso

- **Antes de cada clase:** revisa las diapositivas de ese día (`slides/DayX_bloqueY_student.html`)
- **Después del día 1:** lee el documento *Buenas prácticas en R* (`R_best_practices_ES.html`, en la raíz del repositorio)
- **Para profundizar en el día 3:** *El t-test paso a paso: de Student a R* (`extra/ttest_by_hand.html`) y *ANOVA paso a paso: de Fisher a R* (`extra/anova_by_hand.html`): los dos tests calculados a mano, paso a paso, y comparados con el resultado de R

---

## Descargar el material y actualizarlo

El material se publica poco a poco a lo largo del curso. Hay tres formas de conseguirlo:

**1. Descargar todo en un ZIP (sin instalar nada).** Botón verde `Code` → `Download ZIP` y descomprímelo. Cuando haya material nuevo, descarga otra vez el ZIP y **descomprímelo en una carpeta nueva**: si lo descomprimes encima de la anterior, puedes sobrescribir tu trabajo.

**2. Descargar solo un archivo nuevo.** En GitHub, entra en el archivo (por ejemplo `slides/Day2_bloque1_student.html`) y pulsa el botón de descarga (*Download raw file*). Guárdalo en la misma carpeta que tenías.

**3. Clonar el repositorio con git (recomendado).** Necesitas tener [git](https://git-scm.com/downloads) instalado. La primera vez, en la pestaña *Terminal* de RStudio (junto a *Console*; si no la ves: `Tools` → `Terminal` → `New Terminal`, o `Option + Shift + R` en Mac / `Alt + Shift + R` en Windows), entra en tu carpeta Documentos y clona el repositorio:

```bash
cd ~/Documents
git clone https://github.com/CIMCYC/curso-R-v2026.2.git
```

Esto crea la carpeta `curso-R-v2026.2` con todo el material. Cada vez que haya material nuevo, abre el proyecto `exercises/exercises.Rproj` y escribe en la *Terminal*:

```bash
git pull
```

`git pull` descarga **solo lo que ha cambiado** desde la última vez.

> [!TIP]
> Para que `git pull` no choque con tus cambios, guarda tu trabajo con otro nombre: abre el script del día y usa `File` → `Save As` (por ejemplo, `01_day1_mis_respuestas.R`).

---

## Uso para estudiantes

1. Descarga o clona este repositorio
2. Abre RStudio con doble clic en `exercises/exercises.Rproj` (el proyecto del curso)
3. Abre el script de ejercicios del día correspondiente en `exercises/scripts/`
4. Sigue las instrucciones y completa los ejercicios donde dice `# TU_CODIGO_AQUI`

---

## Nota sobre publicación del material

Los materiales se publican de forma progresiva para que los estudiantes no vean las soluciones antes de intentar los ejercicios por su cuenta:

- **Antes de cada sesión:** se publican las presentaciones en versión estudiante (`slides/DayX_bloqueY_student.html`) y los scripts `exercises/scripts/*_student.R` (el día 4, los documentos `*_student.qmd`)
- **Después de cada sesión:** se publican los scripts `exercises/scripts/*_solutions.R` (el día 4, los `*_solutions.qmd`) en la misma carpeta

---

## Financiación

Esta actividad es parte de la ayuda CEX2023-001312-M, financiada por MICIU/AEI/10.13039/501100011033 y ayuda UCE-PP2023-11 financiada por Universidad de Granada.

---

## Licencia

Materiales creados para uso docente en el programa María de Maeztu (MdM), CIMCYC, Universidad de Granada.
