-- ============================================================================
-- Trabajo Práctico N° 8: Especificación de Requisitos y Consultas SQL
-- Base de datos: chiikawa_db
-- ============================================================================

USE chiikawa_db;

-- Consulta 1: Listar todos los personajes registrados ordenados alfabéticamente por su nombre, mostrando su especie y frase característica.
SELECT nombre, especie, frase_caracteristica
FROM personajes
ORDER BY nombre ASC;

-- Consulta 2: Listar todos los ítems disponibles cuyo precio sea menor a 500 yenes, ordenados de menor a mayor precio.
SELECT item_id, nombre, tipo, precio_yen
FROM items
WHERE precio_yen < 500
ORDER BY precio_yen ASC;

-- Consulta 3: Obtener los monstruos catalogados con peligrosidad 'Alta', ordenados de mayor a menor según su recompensa en yenes.
SELECT monstruo_id, nombre, peligrosidad, recompensa_yen
FROM monstruos
WHERE peligrosidad = 'Alta'
ORDER BY recompensa_yen DESC;

-- Consulta 4: Mostrar todas las misiones que actualmente tienen el estado 'Completada', ordenadas desde la más reciente hasta la más antigua.
SELECT mision_id, personaje_id, trabajo_id, fecha_mision, estado
FROM misiones
WHERE estado = 'Completada'
ORDER BY fecha_mision DESC;

-- Consulta 5: Listar cada personaje junto con el nombre de su licencia laboral, su nivel y el beneficio que otorga.
SELECT p.nombre AS personaje, p.especie, l.nombre_licencia, l.nivel, l.beneficio
FROM personajes p
INNER JOIN licencias l ON p.licencia_id = l.licencia_id
ORDER BY l.nivel DESC;

-- Consulta 6: Obtener el detalle del inventario de todos los personajes, mostrando el nombre del personaje, el nombre del ítem, el tipo y la cantidad que posee.
SELECT p.nombre AS personaje, i.nombre AS item, i.tipo, inv.cantidad
FROM inventarios inv
INNER JOIN personajes p ON inv.personaje_id = p.personaje_id
INNER JOIN items i ON inv.item_id = i.item_id
ORDER BY p.nombre ASC, inv.cantidad DESC;

-- Consulta 7: Mostrar el historial de misiones realizadas, indicando el nombre del personaje, la categoría del trabajo, el pago base en yenes, la fecha y el estado.
SELECT p.nombre AS personaje, t.categoria AS trabajo, t.pago_base_yen, m.fecha_mision, m.estado
FROM misiones m
INNER JOIN personajes p ON m.personaje_id = p.personaje_id
INNER JOIN trabajos t ON m.trabajo_id = t.trabajo_id
ORDER BY m.fecha_mision DESC;

-- Consulta 8: Contar cuántas misiones tiene registradas cada personaje en total, ordenando los resultados de mayor a menor cantidad.
SELECT p.nombre AS personaje, COUNT(m.mision_id) AS total_misiones
FROM personajes p
INNER JOIN misiones m ON p.personaje_id = m.personaje_id
GROUP BY p.personaje_id, p.nombre
ORDER BY total_misiones DESC;

-- Consulta 9: Calcular el dinero total acumulado en recompensas por cada personaje a partir de las cazas con resultado 'Victoria', mostrando los 3 personajes con mayores ganancias.
SELECT p.nombre AS personaje, SUM(mo.recompensa_yen) AS total_recompensas_yen
FROM registro_cazas rc
INNER JOIN personajes p ON rc.personaje_id = p.personaje_id
INNER JOIN monstruos mo ON rc.monstruo_id = mo.monstruo_id
WHERE rc.resultado = 'Victoria'
GROUP BY p.personaje_id, p.nombre
ORDER BY total_recompensas_yen DESC
LIMIT 3;

-- Consulta 10: Calcular el precio promedio de los ítems agrupados por su tipo y la cantidad total de ítems distintos por categoría.
SELECT tipo, COUNT(item_id) AS cantidad_items, AVG(precio_yen) AS precio_promedio_yen
FROM items
GROUP BY tipo
ORDER BY precio_promedio_yen DESC;
