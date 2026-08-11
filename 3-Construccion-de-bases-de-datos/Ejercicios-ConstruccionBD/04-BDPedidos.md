## Código
```sql
CREATE DATABASE Pedidos;
GO

USE Pedidos;
GO 

CREATE TABLE cliente(
    cliente_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_cliente PRIMARY KEY,

    nombre NVARCHAR(50) NOT NULL,
    apellido_1 NVARCHAR(20) NOT NULL,
    apellido_2 NVARCHAR(20) NULL, 
    
    created_at DATETIME2 NOT NULL
    CONSTRAINT df_cliente_created_at 
    DEFAULT SYSDATETIME(),

    updated_at DATETIME2 NOT NULL
    CONSTRAINT df_cliente_updated_at 
    DEFAULT SYSDATETIME(),

    fecha_nacimiento DATE NOT NULL
    CONSTRAINT ck_cliente_fecha_nacimiento 
    CHECK(fecha_nacimiento <= GETDATE())
);
GO


CREATE TABLE pedido(
    pedido_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_pedido 
    PRIMARY KEY, 

    fecha_pedido DATE NOT NULL
    CONSTRAINT ck_pedido_fecha_pedido
    CHECK (fecha_pedido <= GETDATE()),
    
    created_at DATETIME2 NOT NULL
    CONSTRAINT df_pedido_created_at 
    DEFAULT SYSDATETIME(),

    updated_at DATETIME2 NOT NULL
    CONSTRAINT df_pedido_updated_at 
    DEFAULT SYSDATETIME(),

    cliente_id INT NOT NULL
    CONSTRAINT fk_pedido_cliente
    FOREIGN KEY (cliente_id)
    REFERENCES cliente(cliente_id)
);
GO


CREATE TABLE producto(
    producto_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_producto PRIMARY KEY, 
    
    nombre_producto NVARCHAR(30) NOT NULL, 

    created_at DATETIME2 NOT NULL
    CONSTRAINT df_producto_created_at
    DEFAULT SYSDATETIME(),

    updated_at DATETIME2 NOT NULL
    CONSTRAINT df_producto_updated_at
    DEFAULT SYSDATETIME(),

    precio_producto MONEY NOT NULL
    CONSTRAINT ck_producto_precio_producto 
    CHECK (precio_producto > 0.0) 
);
GO


CREATE TABLE detalle_pedido(
    pedido_id INT NOT NULL, 
    producto_id INT NOT NULL, 

    cantidad_venta INT NOT NULL 
    CONSTRAINT ck_detalle_venta_cantidad_venta 
    CHECK(cantidad_venta > 0),

    precio_venta MONEY NOT NULL 
    CONSTRAINT ck_detalle_pedido_precio_venta
    CHECK(precio_venta > 0.0),

    created_at DATETIME2 NOT NULL
    CONSTRAINT df_detalle_pedido_created_at 
    DEFAULT SYSDATETIME(),

    updated_at DATETIME2 NOT NULL
    CONSTRAINT df_detalle_pedido_updated_at
    DEFAULT SYSDATETIME(),

    CONSTRAINT pk_detalle_pedido 
    PRIMARY KEY (pedido_id, producto_id),

    CONSTRAINT fk_detalle_pedido_pedido
    FOREIGN KEY (pedido_id)
    REFERENCES pedido(pedido_id),

    CONSTRAINT fk_detalle_pedido_producto
    FOREIGN KEY (producto_id)
    REFERENCES producto(producto_id)
);
GO
```

<br>

## Diagrama
![Diagrama 4: Pedidos](../../img/Diagramas-SQLServer/Diagrama%204.jpg)