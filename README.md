chiikawa-db-tp08 — Especificación de Requisitos y Consultas SQL: Sistema de Registro de Chiikawa

## 1. Descripción del Sistema (ERS)

### 1.1 Propósito
Este documento presenta la Especificación de Requisitos de Software (ERS) orientada a los datos para el sistema **"Sistema de Registro de Chiikawa" (`chiikawa_db`)**. Su objetivo es formalizar las reglas de negocio y las consultas necesarias para gestionar la vida laboral, las licencias, el inventario y las misiones de caza de los personajes del universo de Chiikawa.

### 1.2 Alcance
El sistema permite administrar personajes y sus niveles de licencia, registrar la asignación y estado de trabajos diarios (como deshierbar), llevar un historial de batallas contra monstruos (Chimeras) y controlar los ítems almacenados en el inventario de cada personaje. Quedan fuera de esta versión inicial la interfaz gráfica web y las transacciones monetarias automáticas entre jugadores.

---

## 2. Requisitos Funcionales (Orientados a los Datos)

* **RF-01 — Gestión de Personajes y Licencias:** El sistema debe permitir registrar personajes identificando su nombre, especie y frase característica, asociándolos a una licencia laboral (`licencia_id`) que determina su nivel y beneficios.
* **RF-02 — Catálogo y Asignación de Trabajos (Misiones):** El sistema debe permitir registrar distintos tipos de trabajos con su categoría, descripción y pago base en yenes, así como asignar misiones a los personajes indicando la fecha y el estado de la tarea (por ejemplo: *Completada*, *Pendiente*).
* **RF-03 — Registro de Cazas de Monstruos:** El sistema debe permitir registrar cada encuentro o batalla entre un personaje y un monstruo (con su nivel de peligrosidad y recompensa en yenes), almacenando la fecha exacta (`fecha_caza`) y el resultado obtenido (por ejemplo: *Victoria*, *Derrota*).
* **RF-04 — Control de Inventarios:** El sistema debe permitir gestionar el inventario individual de cada personaje, asociando ítems (comida, herramientas, armas) y actualizando la cantidad disponible de cada objeto.
* **RF-05 — Consulta de Historial y Rendimiento:** El sistema debe permitir consultar las misiones realizadas, las recompensas obtenidas por caza y el valor total de los ítems acumulados por cada personaje para evaluar su progreso.

---

## 3. Listado Descriptivo de Consultas Principales

1. **Consulta 1:** Listar todos los personajes registrados ordenados alfabéticamente por su nombre, mostrando su especie y frase característica.
2. **Consulta 2:** Listar todos los ítems disponibles cuyo precio sea menor a 500 yenes, ordenados de menor a mayor precio.
3. **Consulta 3:** Obtener los monstruos catalogados con peligrosidad 'Alta', ordenados de mayor a menor según su recompensa en yenes.
4. **Consulta 4:** Mostrar todas las misiones que actualmente tienen el estado 'Completada', ordenadas desde la más reciente hasta la más antigua.
5. **Consulta 5:** Listar cada personaje junto con el nombre de su licencia laboral, su nivel y el beneficio que otorga.
6. **Consulta 6:** Obtener el detalle del inventario de todos los personajes, mostrando el nombre del personaje, el nombre del ítem, el tipo y la cantidad que posee.
7. **Consulta 7:** Mostrar el historial de misiones realizadas, indicando el nombre del personaje, la categoría del trabajo, el pago base en yenes, la fecha y el estado.
8. **Consulta 8:** Contar cuántas misiones tiene registradas cada personaje en total, ordenando los resultados de mayor a menor cantidad.
9. **Consulta 9:** Calcular el dinero total acumulado en recompensas por cada personaje a partir de las cazas con resultado 'Victoria', mostrando los 3 personajes con mayores ganancias.
10. **Consulta 10:** Calcular el precio promedio de los ítems agrupados por su tipo (comida, herramienta, etc.) y la cantidad total de ítems distintos por categoría.

---

## 4. Ficha de Declaración de Uso de IA

| Herramienta | Propósito | Prompt Utilizado | Ajuste / Edición | Aprendizaje |
| :--- | :--- | :--- | :--- | :--- |
| Gemini | Estructurar la Especificación de Requisitos (ERS) y redactar las consultas SQL adaptadas al esquema `chiikawa_db` del TP N° 7. | *"Tengo que hacer el TP N° 8 de Especificación de Requisitos y Consultas SQL usando mi base de datos chiikawa_db del TP 7 (adjuntando captura del modelo relacional y README)."* | Revisé que los nombres de tablas y columnas coincidieran exactamente con mi base de datos en phpMyAdmin y ajusté los valores de filtro (`estado`, `peligrosidad`, `resultado`) según los datos cargados en mis tablas. | Comprendí cómo transformar los objetivos de un proyecto de base de datos en Requisitos Funcionales formales y cómo combinar `JOIN`, `WHERE`, `GROUP BY` y funciones de agregación (`COUNT`, `SUM`, `AVG`) para obtener reportes útiles. |
