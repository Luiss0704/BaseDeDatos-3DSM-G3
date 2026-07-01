# Diccionario de Datos de la Base de Datos Pedidos

## 1. Información General

| Elemento |  Valor |
| :--- | :--- |
| Proyecto | Base de datos de pedidos |
| Versión | 1.0 |
| Fecha | 28 de Junio 2026 |
| Elaboró  | Luis Fernando Gabriel Nieto Sánchez |
| SGBD | SQLServer |


<br>

## 2. Descripción del Sistema de Base de Datos

El sistema administra:
- Cliente
- Pedidos de venta
- Detalle del pedido
- Producto

Permite gestionar el ciclo de ventas al por mayor, garantizando la trazabilidad entre el cliente que realiza la compra y los productos adquiridos en cada pedido, manteniendo el histórico de precios y cantidades.


<br>

## 3. Catálogo de Restricciones

| Código |  Significado |
| :---: | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |


<br>

## 4. Dirección de Datos

**Tabla:** Cliente

**Descripción:** _Almacena la información institucional de los clientes de la empresa. Al ser personas morales, esta tabla sirve como el catálogo maestro para identificar a quién se le están facturando los pedidos_

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| id_cliente| INT | - | NN,  PK |Identificador del cliente|
| nombre | NVARCHAR | 50 |  NN| Nombre del cliente|
| apellido_1| NVARCHAR| 30 | NN | Apellido paterno |
| apellido_2| NVARCHAR| 20 | NULL | Apellido materno |
| fecha_naci| DATE| - | NN | Fecha de nacimiento|

<br>

---

<br>

**Tabla:** Pedido

**Descripción:** _Almacena cada operación comercial. Registra la fecha en la que se efectuó la transacción y mantiene el vínculo obligatorio con el cliente que realizó la compra_

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| num_pedido| INT | - | NN, PK |Identificador único del pedido|
| fecha_pedido |DATE| -| NN| Fecha del pedido|
| id_cliente |INT| -| NN, FK| Cliente que realiza el pedido |

<br>

---

<br>

**Tabla:** Producto

**Descripción:** _Almacena todos los artículos que la empresa tiene disponibles para la venta. Contiene el precio base actual, el cual sirve como referencia para nuevas operaciones_

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| numero_producto| INT | - | NN, PK| Identidficador del producto|
| nombre_producto |NVARCHAR| 30 | NN| Nombre del producto |
| precio_producto |MONEY| -| NN, CK(>0)|Precio del producto|

<br>

---

<br>

**Tabla:** DetallePedido

**Descripción:** _Almacena la cantidad exacta vendida y congelar el precio de venta al momento de la transacción, asegurando que el histórico de ventas no se vea afectado por futuros cambios en los precios del catálogo_

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| numero_pedido| INT | - | NN, PK, FK| Relación con el pedido|
| numero_producto |INT| - | PK, FK| Relación con el producto |
| cantidad_venta |INT| -| NN, CK(>0)|Unidades vendidad|
| precio_venta |MONEY| -| NN, CK(>0)|Precio de venta|


<br>

## 5. Relaciones

|  Relación | Cardinalidad | Descripción |
|:----------|:---------:|:----------|
| Cliente -> Pedido    | 1:N |Un cliente puede realizar muchos pedidos|
| Pedido -> Detalle_del_Pedido   | 1:N | Un pedido puede tener varios detalles|
| Producto -> Detalle_del_Pedido   | 1:N |Un producto puede estar en muchos detalles de pedido|


<br>

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
|:----------|:---------:|:----------|
|Pedido | id_cliente | Cliente (id_cliente)  |
|Detalle_del_Pedido | numero_pedido | Pedido (numero_pedido)  |
|Detalle_del_Pedido | numero_producto  | Pedido (numero_producto)  |


<br>

## 7. Integridad referencial

| Regla |  Descripción |
| :---: | :--- |
| IR-01 |No se puede registrar un pedido sin un cliente válido|
| IR-02 | El detalle de un pedido no existe sin un pedido padre y sin un producto válido|
| IR-03 |NNo se pueden eliminar productos o pedidos si tienen registros en la tabla Detalle_del_Pedido|
| IR-04 |No se pueden eliminar productos o pedidos si tienen registros en la tabla Detalle_del_Pedido|


<br>

## 8. Regla del negocio

|Código |Regla |
| :---: | :--- |
| RN-01 | Un cliente puede realizar muchos pedidos |
| RN-02 | Cada pedido pertenece a un solo cliente |
| RN-03 | Un pedido contiene varios productos |
| RN-04 | Un producto puede aparecer en muchos pedidos |
| RN-05 | Un pedido debe contener al menos un producto |
| RN-06 | Un producto puede no haber sido vendido |
| RN-07 | El detalle del pedido no existe sin pedido |
| RN-08 | El detalle del pedido no existe sin producto |
| RN-09 | El detalle del pedido alamacena cantidad vendida y precio de venta |


<br>

## 9. Diagrama relacional

![Solución al ejercicio](/img/Relacional/Ejercicio%204%20Relacional.png)

