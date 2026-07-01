# Ejercicios del modelo Entidad - Relación

## Ejercicio 1
Un hospital registra información de sus pacientes.
> De cada paciente se almacena lo siguiente:
- Identificador
- Nombre
- Fecha de nacimiento

> De cada expediente médico se debe almacenar:
- Número de expediente.
- Fecha de apertura.
- Tipo de sangre.

> Reglas del negocio:
- Cada paciente debe tener exactamente un expediente médico.
- Cada expediente médico pertenece a un único paciente.
- No puede existir un expediente sin paciente.
- No puede existir un paciente sin expediente.

<br>

### Solución del ejercicio
![Solución Ejercicio 1](../img/E-R/Ejercicio%201.png)

<br>
<br>

## Ejercicio 2
Una universidad administra profesores y cursos.
> De cada profesor se almacena:
- Número de profesor
- Nombre
- Especialidad

> De cada curso se almacena:
- Número de curso
- Nombre
- Créditos

> Reglas del negocio:
1. Un profesor puede impartir varios cursos.
2. Un curso solamente puede ser impartido por un profesor.
3. Puede existir un profesor que actualmente no imparta cursos 😛
4. Todo curso debe estar asignado a un profesor.

> Lo que se debe realizar:
- Identificar y dibujar las entidades (en mayúsculas y en singular).
- Identificar y dibujar la relación **IMPARTE**
- Determinar la razón de cardinalidad
- Determinar la participación

<br>

### Solución del ejercicio
![Solución Ejercicio 2](../img/E-R/Ejercicio%202.png)

<br>
<br>

## Ejercicio 3
Una escuela administra alumnos y materias.
> De cada alumno se almacena:
- Matrícula
- Nombre
- Semestre

> De cada materia se almacena:
- Clave de la materia
- Nombre de la materia
- Créditos

> Reglas del negocio:
1. Un alumno puede inscribirse en varias materias.
2. Una materia puede tener muchos alumnos inscritos.
3. Puede existir una materia sin alumnos inscritos.
4. Todo alumno debe estar inscrito en un al menos 1 materia.
5. De cada inscripción se desea almacenar:
    
    - Fecha de inscripción
    - Calificación final

    Nota: La relación se debe llamar **INSCRIBE**

> Lo que se debe realizar:
- Identificar y dibujar las entidades (en mayúsculas y en singular).
- Identificar y dibujar la relación.
- Determinar la razón de cardinalidad
- Determinar la participación

<br>

### Solución del ejercicio
![Solución Ejercicio 3](../img/E-R/Ejercicio%203.png)

<br>
<br>

## Ejercicio 4
Una empresa se dedica a la venta de productos al por mayor y necesita registrar lo siguiente:
> De los clientes se almacena:
- Identificador del cliente
- Nombre del cliente (persona moral)

> De los pedidos de venta se almacena:
- Número del pedido
- Fecha del pedido

> De los productos se almacena:
- Número del producto
- Nombre del producto
- Precio del producto

> Reglas del negocio:
1. Un cliente puede realizar varios pedidos.
2. Cada pedido pertenece a un solo cliente.
3. Un pedido contiene varios productos.
4. Un producto puede aparecer en muchos pedidos.
5. Un pedido debe contener al menos 1 producto.
6. Un producto puede no haber sido pedido.
7. El detalle del pedido no existe sin pedido.
8. El detalle del pedido no existe sin producto.
9. El detalle del pedido almacena cantidad vendida y precio de venta.

<br>

### Solución no. 1 del ejercicio
![Solución 1 - Ejercicio 4](../img/E-R/Ejercicio%204.1.png)

### Solución no. 2 del ejercicio
![Solución 2 - Ejercicio 4](../img/E-R/Ejercicio%204.2.png)