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
- Visualización de datos con ggplot2 y la gramática de gráficos
- Reportes reproducibles con Quarto
- Resolución de dudas y problemas

---

## Presentaciones para estudiantes

Cada bloque tiene una versión para estudiantes, **sin las diapositivas de solución** de los ejercicios: `slides/DayX_bloqueY_student.html`.

| Día | Presentaciones |
|-----|----------------|
| Día 1 | `Day1_bloque1_student.html`, `Day1_bloque2_student.html`, `Day1_bloque3_student.html` |
| Día 2 | `Day2_bloque1_student.html`, `Day2_bloque2_student.html`, `Day2_bloque3_student.html` |

Los archivos `.html` se abren directamente en el navegador (doble clic) y no necesitan conexión.

---

## Estructura de carpetas

```
.
├── README.md                      Este documento
│
├── slides/                        Presentaciones
│   └── DayX_bloqueY_student.html  Versión estudiante (sin soluciones)
│
└── exercises/                     Ejercicios en clase
    ├── exercises.Rproj            Proyecto RStudio
    ├── data/
    │   ├── raw_data/              Datos originales (solo lectura)
    │   └── processed_data/        Datos preprocesados
    └── scripts/                   Scripts de ejercicios
```

---

## Datos

El curso utiliza un **ensayo clínico sintético** como hilo conductor:

- 300 pacientes asignados aleatoriamente a 3 grupos: **CBT (tarepia cognitivo conductual)**, **farmacológico**, **control**
- Variables: ansiedad (GAD-7), depresión (PHQ-9), bienestar, soledad (UCLA), autoestima (Rosenberg)
- Medidas pre-tratamiento, post-tratamiento y seguimiento (followup) a 3 meses

Los datos están en `exercises/data/raw_data/`.

---

## Uso para estudiantes

1. Descarga o clona este repositorio
2. Abre RStudio con doble clic en `exercises/exercises.Rproj` (el proyecto del curso)
3. Abre el script de ejercicios del día correspondiente en `exercises/scripts/`
4. Sigue las instrucciones y completa los ejercicios donde dice `# TU_CODIGO_AQUI`

---

## Nota sobre publicación del material

Los materiales se publican de forma progresiva para que los estudiantes no vean las soluciones antes de intentar los ejercicios por su cuenta:

- **Antes de cada sesión:** se publican las presentaciones en versión estudiante (`slides/DayX_bloqueY_student.html`) y los scripts `exercises/scripts/*_student.R`
- **Después de cada sesión:** se publican los scripts `exercises/scripts/*_solutions.R` en la misma carpeta

---

## Financiación

Esta actividad es parte de la ayuda CEX2023-001312-M, financiada por MICIU/AEI/10.13039/501100011033 y ayuda UCE-PP2023-11 financiada por Universidad de Granada.

---

## Licencia

Materiales creados para uso docente en el programa María de Maeztu (MdM), CIMCYC, Universidad de Granada.
