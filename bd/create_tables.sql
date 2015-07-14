DROP TABLE proyecto_administrativo.tipospago_cuentasbancarias;
DROP TABLE proyecto_administrativo.impuestos_compras;
DROP TABLE proyecto_administrativo.impuestos_ventas;
DROP TABLE proyecto_administrativo.impuestos_mercancias;
DROP TABLE proyecto_administrativo.impuestos_productos;
DROP TABLE proyecto_administrativo.empresas_sistema;
DROP TABLE proyecto_administrativo.nomina_empleados;
DROP TABLE proyecto_administrativo.mercancias_productos;
DROP TABLE proyecto_administrativo.cuotas_compra;
DROP TABLE proyecto_administrativo.cuotas_venta;
DROP TABLE proyecto_administrativo.nomina;
DROP TABLE proyecto_administrativo.compras;
DROP TABLE proyecto_administrativo.facturas_compra;
DROP TABLE proyecto_administrativo.proveedor;
DROP TABLE proyecto_administrativo.ventas;
DROP TABLE proyecto_administrativo.facturas_venta;
DROP TABLE proyecto_administrativo.cuentas_bancarias;
DROP TABLE proyecto_administrativo.clientes;
DROP TABLE proyecto_administrativo.usuarios;
DROP TABLE proyecto_administrativo.empleados;
DROP TABLE proyecto_administrativo.productos;
DROP TABLE proyecto_administrativo.impuestos;
DROP TABLE proyecto_administrativo.mercancias;
DROP TABLE proyecto_administrativo.empresas;
DROP TABLE proyecto_administrativo.tipos_pago;
DROP TABLE proyecto_administrativo.cargos;
DROP TABLE proyecto_administrativo.tipos_usuarios;
DROP TABLE proyecto_administrativo.personas;
DROP TABLE proyecto_administrativo.bancos;

CREATE TABLE proyecto_administrativo.bancos (
       id_banco SERIAL NOT NULL
     , nombre VARCHAR(100) NOT NULL
     , descripcion TEXT
);

CREATE TABLE proyecto_administrativo.personas (
       ci SERIAL NOT NULL
     , nombre VARCHAR(100) NOT NULL
     , apellido VARCHAR(100) NOT NULL
     , telefono CHAR(11)
     , email VARCHAR(100)
);

CREATE TABLE proyecto_administrativo.tipos_usuarios (
       id_tipo_usuario SERIAL NOT NULL
     , nombre VARCHAR(100) NOT NULL
     , descripcion TEXT
);

CREATE TABLE proyecto_administrativo.cargos (
       id_cargo SERIAL NOT NULL
     , nombre VARCHAR(100) NOT NULL
     , descripcion TEXT
);

CREATE TABLE proyecto_administrativo.tipos_pago (
       id_tipo_pago SERIAL NOT NULL
     , nombre VARCHAR(100) NOT NULL
);

CREATE TABLE proyecto_administrativo.empresas (
       rif VARCHAR(100) NOT NULL
     , nombre VARCHAR(100) NOT NULL
     , descripcion TEXT
);

CREATE TABLE proyecto_administrativo.mercancias (
       id_mercancia SERIAL NOT NULL
     , nombre VARCHAR(100) NOT NULL
     , descripcion TEXT
     , precio MONEY NOT NULL
     , cantidad_inicial FLOAT4 NOT NULL
);

CREATE TABLE proyecto_administrativo.impuestos (
       id_impuesto SERIAL NOT NULL
     , nombre VARCHAR(100) NOT NULL
     , porcentaje FLOAT4 NOT NULL
     , descripcion TEXT
);

CREATE TABLE proyecto_administrativo.productos (
       id_producto SERIAL NOT NULL
     , nombre VARCHAR(100) NOT NULL
     , descripcion TEXT
     , precio MONEY NOT NULL
     , cantidad_inicial FLOAT4 NOT NULL
);

CREATE TABLE proyecto_administrativo.empleados (
       id_empleado SERIAL NOT NULL
     , sueldo MONEY NOT NULL
     , fecha_hora DATE NOT NULL
     , ci INTEGER NOT NULL
     , id_cargo INTEGER NOT NULL
);

CREATE TABLE proyecto_administrativo.usuarios (
       usuario VARCHAR(100) NOT NULL
     , clave VARCHAR(100) NOT NULL
     , ci INTEGER NOT NULL
     , id_tipo_usuario INTEGER NOT NULL
);

CREATE TABLE proyecto_administrativo.clientes (
       id_cliente SERIAL NOT NULL
     , fecha_hora DATE NOT NULL
     , ci INTEGER
     , rif VARCHAR(100)
);

CREATE TABLE proyecto_administrativo.cuentas_bancarias (
       id_cuenta_bancaria SERIAL NOT NULL
     , numero CHAR(20)
     , descripcion TEXT
     , saldo_inicial MONEY NOT NULL
     , id_banco INTEGER
);

CREATE TABLE proyecto_administrativo.facturas_venta (
       id_factura_venta SERIAL NOT NULL
     , fecha_hora DATE NOT NULL
     , fecha_hora_vencimiento DATE NOT NULL
     , id_cliente INTEGER NOT NULL
     , usuario VARCHAR(100) NOT NULL
     , cerrada BOOLEAN NOT NULL
);

CREATE TABLE proyecto_administrativo.ventas (
       id_venta SERIAL NOT NULL
     , fecha_hora DATE NOT NULL
     , id_producto INTEGER NOT NULL
     , precio_unitario MONEY NOT NULL
     , cantidad FLOAT4 NOT NULL
     , iva_porcentaje FLOAT4 NOT NULL
     , iva_money MONEY NOT NULL
     , precio_pagar MONEY NOT NULL
     , id_factura_venta INTEGER NOT NULL
);

CREATE TABLE proyecto_administrativo.proveedor (
       id_proveedor SERIAL NOT NULL
     , fecha_hora DATE NOT NULL
     , rif VARCHAR(100)
     , ci INTEGER
);

CREATE TABLE proyecto_administrativo.facturas_compra (
       id_factura_compra SERIAL NOT NULL
     , fecha_hora DATE NOT NULL
     , fecha_hora_vencimiento DATE NOT NULL
     , id_proveedor INTEGER NOT NULL
     , usuario VARCHAR(100) NOT NULL
     , cerrada BOOLEAN NOT NULL
);

CREATE TABLE proyecto_administrativo.compras (
       id_compra SERIAL NOT NULL
     , fecha_hora DATE NOT NULL
     , id_mercancia INTEGER NOT NULL
     , precio_unitario MONEY NOT NULL
     , cantidad FLOAT4 NOT NULL
     , iva_porcentaje FLOAT4 NOT NULL
     , iva_money MONEY NOT NULL
     , precio_pagar MONEY NOT NULL
     , id_factura_compra INTEGER NOT NULL
);

CREATE TABLE proyecto_administrativo.nomina (
       id_pago_nomina SERIAL NOT NULL
     , monto MONEY NOT NULL
     , fecha_hora DATE NOT NULL
     , usuario VARCHAR(100) NOT NULL
);

CREATE TABLE proyecto_administrativo.cuotas_venta (
       id_cuota_venta SERIAL NOT NULL
     , monto MONEY NOT NULL
     , fecha_hora DATE NOT NULL
     , id_factura_venta INTEGER NOT NULL
     , id_tipo_pago INTEGER NOT NULL
     , usuario VARCHAR(100) NOT NULL
     , numero_tarjeta VARCHAR(100)
     , codigo_seguridad VARCHAR(100)
     , id_banco INTEGER
);

CREATE TABLE proyecto_administrativo.cuotas_compra (
       id_cuota_compra SERIAL NOT NULL
     , monto MONEY NOT NULL
     , fecha_hora DATE NOT NULL
     , id_factura_compra INTEGER NOT NULL
     , id_tipo_pago INTEGER NOT NULL
     , usuario VARCHAR(100) NOT NULL
     , numero_tarjeta VARCHAR(100)
     , codigo_seguridad VARCHAR(100)
     , id_banco INTEGER
);

CREATE TABLE proyecto_administrativo.mercancias_productos (
       id SERIAL NOT NULL
     , id_mercancia INTEGER NOT NULL
     , cantidad_mercancias FLOAT4 NOT NULL
     , id_producto INTEGER NOT NULL
     , cantidad_productos FLOAT4 NOT NULL
);

CREATE TABLE proyecto_administrativo.nomina_empleados (
       id SERIAL NOT NULL
     , pago MONEY NOT NULL
     , fecha_hora DATE NOT NULL
     , id_pago_nomina INTEGER NOT NULL
     , id_empleado INTEGER NOT NULL
     , id_tipo_pago INTEGER NOT NULL
);

CREATE TABLE proyecto_administrativo.empresas_sistema (
       id_empresa_sistema SERIAL NOT NULL
     , fecha_hora DATE NOT NULL
     , rif VARCHAR(100) NOT NULL
);

CREATE TABLE proyecto_administrativo.impuestos_productos (
       id SERIAL NOT NULL
     , id_impuesto INTEGER NOT NULL
     , id_producto INTEGER NOT NULL
);

CREATE TABLE proyecto_administrativo.impuestos_mercancias (
       id SERIAL NOT NULL
     , id_impuesto INTEGER NOT NULL
     , id_mercancia INTEGER NOT NULL
);

CREATE TABLE proyecto_administrativo.impuestos_ventas (
       id SERIAL NOT NULL
     , id_impuesto INTEGER NOT NULL
     , id_venta INTEGER NOT NULL
     , porcentaje FLOAT4
);

CREATE TABLE proyecto_administrativo.impuestos_compras (
       id SERIAL NOT NULL
     , id_impuesto INTEGER NOT NULL
     , id_compra INTEGER NOT NULL
     , porcentaje FLOAT4
);

CREATE TABLE proyecto_administrativo.tipospago_cuentasbancarias (
       id SERIAL NOT NULL
     , id_tipo_pago INTEGER NOT NULL
     , id_cuenta_bancaria INTEGER NOT NULL
);

ALTER TABLE proyecto_administrativo.bancos
  ADD CONSTRAINT PK_BANCOS
      PRIMARY KEY (id_banco);

ALTER TABLE proyecto_administrativo.personas
  ADD CONSTRAINT PK_PERSONAS
      PRIMARY KEY (ci);

ALTER TABLE proyecto_administrativo.tipos_usuarios
  ADD CONSTRAINT PK_TIPOS_USUARIOS
      PRIMARY KEY (id_tipo_usuario);

ALTER TABLE proyecto_administrativo.cargos
  ADD CONSTRAINT PK_CARGOS
      PRIMARY KEY (id_cargo);

ALTER TABLE proyecto_administrativo.tipos_pago
  ADD CONSTRAINT PK_TIPOS_PAGO
      PRIMARY KEY (id_tipo_pago);

ALTER TABLE proyecto_administrativo.empresas
  ADD CONSTRAINT PK_EMPRESAS
      PRIMARY KEY (rif);

ALTER TABLE proyecto_administrativo.mercancias
  ADD CONSTRAINT PK_MERCANCIAS
      PRIMARY KEY (id_mercancia);

ALTER TABLE proyecto_administrativo.impuestos
  ADD CONSTRAINT PK_IMPUESTOS
      PRIMARY KEY (id_impuesto);

ALTER TABLE proyecto_administrativo.productos
  ADD CONSTRAINT PK_PRODUCTOS
      PRIMARY KEY (id_producto);

ALTER TABLE proyecto_administrativo.empleados
  ADD CONSTRAINT PK_EMPLEADOS
      PRIMARY KEY (id_empleado);

ALTER TABLE proyecto_administrativo.usuarios
  ADD CONSTRAINT PK_USUARIOS
      PRIMARY KEY (usuario);

ALTER TABLE proyecto_administrativo.clientes
  ADD CONSTRAINT PK_CLIENTES
      PRIMARY KEY (id_cliente);

ALTER TABLE proyecto_administrativo.cuentas_bancarias
  ADD CONSTRAINT PK_CUENTAS_BANCARIAS
      PRIMARY KEY (id_cuenta_bancaria);

ALTER TABLE proyecto_administrativo.facturas_venta
  ADD CONSTRAINT PK_FACTURAS_VENTA
      PRIMARY KEY (id_factura_venta);

ALTER TABLE proyecto_administrativo.ventas
  ADD CONSTRAINT PK_VENTAS
      PRIMARY KEY (id_venta);

ALTER TABLE proyecto_administrativo.proveedor
  ADD CONSTRAINT PK_PROVEEDOR
      PRIMARY KEY (id_proveedor);

ALTER TABLE proyecto_administrativo.facturas_compra
  ADD CONSTRAINT PK_FACTURAS_COMPRA
      PRIMARY KEY (id_factura_compra);

ALTER TABLE proyecto_administrativo.compras
  ADD CONSTRAINT PK_COMPRAS
      PRIMARY KEY (id_compra);

ALTER TABLE proyecto_administrativo.nomina
  ADD CONSTRAINT PK_NOMINA
      PRIMARY KEY (id_pago_nomina);

ALTER TABLE proyecto_administrativo.cuotas_venta
  ADD CONSTRAINT PK_CUOTAS_VENTA
      PRIMARY KEY (id_cuota_venta);

ALTER TABLE proyecto_administrativo.cuotas_compra
  ADD CONSTRAINT PK_CUOTAS_COMPRA
      PRIMARY KEY (id_cuota_compra);

ALTER TABLE proyecto_administrativo.mercancias_productos
  ADD CONSTRAINT PK_MERCANCIAS_PRODUCTOS
      PRIMARY KEY (id);

ALTER TABLE proyecto_administrativo.nomina_empleados
  ADD CONSTRAINT PK_NOMINA_EMPLEADOS
      PRIMARY KEY (id);

ALTER TABLE proyecto_administrativo.empresas_sistema
  ADD CONSTRAINT PK_EMPRESAS_SISTEMA
      PRIMARY KEY (id_empresa_sistema);

ALTER TABLE proyecto_administrativo.impuestos_productos
  ADD CONSTRAINT PK_IMPUESTOS_PRODUCTOS
      PRIMARY KEY (id);

ALTER TABLE proyecto_administrativo.impuestos_mercancias
  ADD CONSTRAINT PK_IMPUESTOS_MERCANCIAS
      PRIMARY KEY (id);

ALTER TABLE proyecto_administrativo.impuestos_ventas
  ADD CONSTRAINT PK_IMPUESTOS_VENTAS
      PRIMARY KEY (id);

ALTER TABLE proyecto_administrativo.impuestos_compras
  ADD CONSTRAINT PK_IMPUESTOS_COMPRAS
      PRIMARY KEY (id);

ALTER TABLE proyecto_administrativo.tipospago_cuentasbancarias
  ADD CONSTRAINT PK_TIPOSPAGO_CUENTASBANCARIAS
      PRIMARY KEY (id);

ALTER TABLE proyecto_administrativo.empleados
  ADD CONSTRAINT FK_empleados_1
      FOREIGN KEY (ci)
      REFERENCES proyecto_administrativo.personas (ci);

ALTER TABLE proyecto_administrativo.empleados
  ADD CONSTRAINT FK_empleados_2
      FOREIGN KEY (id_cargo)
      REFERENCES proyecto_administrativo.cargos (id_cargo);

ALTER TABLE proyecto_administrativo.usuarios
  ADD CONSTRAINT FK_usuarios_1
      FOREIGN KEY (ci)
      REFERENCES proyecto_administrativo.personas (ci);

ALTER TABLE proyecto_administrativo.usuarios
  ADD CONSTRAINT FK_usuarios_2
      FOREIGN KEY (id_tipo_usuario)
      REFERENCES proyecto_administrativo.tipos_usuarios (id_tipo_usuario);

ALTER TABLE proyecto_administrativo.clientes
  ADD CONSTRAINT FK_clientes_1
      FOREIGN KEY (ci)
      REFERENCES proyecto_administrativo.personas (ci);

ALTER TABLE proyecto_administrativo.clientes
  ADD CONSTRAINT FK_clientes_2
      FOREIGN KEY (rif)
      REFERENCES proyecto_administrativo.empresas (rif);

ALTER TABLE proyecto_administrativo.cuentas_bancarias
  ADD CONSTRAINT FK_cuentas_bancarias_1
      FOREIGN KEY (id_banco)
      REFERENCES proyecto_administrativo.bancos (id_banco);

ALTER TABLE proyecto_administrativo.facturas_venta
  ADD CONSTRAINT FK_facturas_venta_1
      FOREIGN KEY (id_cliente)
      REFERENCES proyecto_administrativo.clientes (id_cliente);

ALTER TABLE proyecto_administrativo.facturas_venta
  ADD CONSTRAINT FK_facturas_venta_2
      FOREIGN KEY (usuario)
      REFERENCES proyecto_administrativo.usuarios (usuario);

ALTER TABLE proyecto_administrativo.ventas
  ADD CONSTRAINT FK_ventas_1
      FOREIGN KEY (id_producto)
      REFERENCES proyecto_administrativo.productos (id_producto);

ALTER TABLE proyecto_administrativo.ventas
  ADD CONSTRAINT FK_ventas_2
      FOREIGN KEY (id_factura_venta)
      REFERENCES proyecto_administrativo.facturas_venta (id_factura_venta);

ALTER TABLE proyecto_administrativo.proveedor
  ADD CONSTRAINT FK_proveedor_1
      FOREIGN KEY (rif)
      REFERENCES proyecto_administrativo.empresas (rif);

ALTER TABLE proyecto_administrativo.proveedor
  ADD CONSTRAINT FK_proveedor_2
      FOREIGN KEY (ci)
      REFERENCES proyecto_administrativo.personas (ci);

ALTER TABLE proyecto_administrativo.facturas_compra
  ADD CONSTRAINT FK_facturas_compra_1
      FOREIGN KEY (id_proveedor)
      REFERENCES proyecto_administrativo.proveedor (id_proveedor);

ALTER TABLE proyecto_administrativo.facturas_compra
  ADD CONSTRAINT FK_facturas_compra_2
      FOREIGN KEY (usuario)
      REFERENCES proyecto_administrativo.usuarios (usuario);

ALTER TABLE proyecto_administrativo.compras
  ADD CONSTRAINT FK_compras_2
      FOREIGN KEY (id_factura_compra)
      REFERENCES proyecto_administrativo.facturas_compra (id_factura_compra);

ALTER TABLE proyecto_administrativo.compras
  ADD CONSTRAINT FK_compras_3
      FOREIGN KEY (id_mercancia)
      REFERENCES proyecto_administrativo.mercancias (id_mercancia);

ALTER TABLE proyecto_administrativo.nomina
  ADD CONSTRAINT FK_nomina_1
      FOREIGN KEY (usuario)
      REFERENCES proyecto_administrativo.usuarios (usuario);

ALTER TABLE proyecto_administrativo.cuotas_venta
  ADD CONSTRAINT FK_cuotas_venta_1
      FOREIGN KEY (id_factura_venta)
      REFERENCES proyecto_administrativo.facturas_venta (id_factura_venta);

ALTER TABLE proyecto_administrativo.cuotas_venta
  ADD CONSTRAINT FK_cuotas_venta_2
      FOREIGN KEY (id_tipo_pago)
      REFERENCES proyecto_administrativo.tipos_pago (id_tipo_pago);

ALTER TABLE proyecto_administrativo.cuotas_venta
  ADD CONSTRAINT FK_cuotas_venta_3
      FOREIGN KEY (usuario)
      REFERENCES proyecto_administrativo.usuarios (usuario);

ALTER TABLE proyecto_administrativo.cuotas_venta
  ADD CONSTRAINT FK_cuotas_venta_4
      FOREIGN KEY (id_banco)
      REFERENCES proyecto_administrativo.bancos (id_banco);

ALTER TABLE proyecto_administrativo.cuotas_compra
  ADD CONSTRAINT FK_cuotas_compra_1
      FOREIGN KEY (id_factura_compra)
      REFERENCES proyecto_administrativo.facturas_compra (id_factura_compra);

ALTER TABLE proyecto_administrativo.cuotas_compra
  ADD CONSTRAINT FK_cuotas_compra_2
      FOREIGN KEY (id_tipo_pago)
      REFERENCES proyecto_administrativo.tipos_pago (id_tipo_pago);

ALTER TABLE proyecto_administrativo.cuotas_compra
  ADD CONSTRAINT FK_cuotas_compra_3
      FOREIGN KEY (usuario)
      REFERENCES proyecto_administrativo.usuarios (usuario);

ALTER TABLE proyecto_administrativo.cuotas_compra
  ADD CONSTRAINT FK_cuotas_compra_4
      FOREIGN KEY (id_banco)
      REFERENCES proyecto_administrativo.bancos (id_banco);

ALTER TABLE proyecto_administrativo.mercancias_productos
  ADD CONSTRAINT FK_mercancias_productos_1
      FOREIGN KEY (id_mercancia)
      REFERENCES proyecto_administrativo.mercancias (id_mercancia);

ALTER TABLE proyecto_administrativo.mercancias_productos
  ADD CONSTRAINT FK_mercancias_productos_2
      FOREIGN KEY (id_producto)
      REFERENCES proyecto_administrativo.productos (id_producto);

ALTER TABLE proyecto_administrativo.nomina_empleados
  ADD CONSTRAINT FK_nomina_empleados_1
      FOREIGN KEY (id_pago_nomina)
      REFERENCES proyecto_administrativo.nomina (id_pago_nomina);

ALTER TABLE proyecto_administrativo.nomina_empleados
  ADD CONSTRAINT FK_nomina_empleados_2
      FOREIGN KEY (id_empleado)
      REFERENCES proyecto_administrativo.empleados (id_empleado);

ALTER TABLE proyecto_administrativo.nomina_empleados
  ADD CONSTRAINT FK_nomina_empleados_3
      FOREIGN KEY (id_tipo_pago)
      REFERENCES proyecto_administrativo.tipos_pago (id_tipo_pago);

ALTER TABLE proyecto_administrativo.empresas_sistema
  ADD CONSTRAINT FK_empresas_sistema_1
      FOREIGN KEY (rif)
      REFERENCES proyecto_administrativo.empresas (rif);

ALTER TABLE proyecto_administrativo.impuestos_productos
  ADD CONSTRAINT FK_impuestos_productos_1
      FOREIGN KEY (id_impuesto)
      REFERENCES proyecto_administrativo.impuestos (id_impuesto);

ALTER TABLE proyecto_administrativo.impuestos_productos
  ADD CONSTRAINT FK_impuestos_productos_2
      FOREIGN KEY (id_producto)
      REFERENCES proyecto_administrativo.productos (id_producto);

ALTER TABLE proyecto_administrativo.impuestos_mercancias
  ADD CONSTRAINT FK_impuestos_mercancias_1
      FOREIGN KEY (id_impuesto)
      REFERENCES proyecto_administrativo.impuestos (id_impuesto);

ALTER TABLE proyecto_administrativo.impuestos_mercancias
  ADD CONSTRAINT FK_impuestos_mercancias_2
      FOREIGN KEY (id_mercancia)
      REFERENCES proyecto_administrativo.mercancias (id_mercancia);

ALTER TABLE proyecto_administrativo.impuestos_ventas
  ADD CONSTRAINT FK_impuestos_ventas_1
      FOREIGN KEY (id_impuesto)
      REFERENCES proyecto_administrativo.impuestos (id_impuesto);

ALTER TABLE proyecto_administrativo.impuestos_ventas
  ADD CONSTRAINT FK_impuestos_ventas_2
      FOREIGN KEY (id_venta)
      REFERENCES proyecto_administrativo.ventas (id_venta);

ALTER TABLE proyecto_administrativo.impuestos_compras
  ADD CONSTRAINT FK_impuestos_compras_1
      FOREIGN KEY (id_impuesto)
      REFERENCES proyecto_administrativo.impuestos (id_impuesto);

ALTER TABLE proyecto_administrativo.impuestos_compras
  ADD CONSTRAINT FK_impuestos_compras_2
      FOREIGN KEY (id_compra)
      REFERENCES proyecto_administrativo.compras (id_compra);

ALTER TABLE proyecto_administrativo.tipospago_cuentasbancarias
  ADD CONSTRAINT FK_tipospago_cuentasbancarias_1
      FOREIGN KEY (id_tipo_pago)
      REFERENCES proyecto_administrativo.tipos_pago (id_tipo_pago);

ALTER TABLE proyecto_administrativo.tipospago_cuentasbancarias
  ADD CONSTRAINT FK_tipospago_cuentasbancarias_2
      FOREIGN KEY (id_cuenta_bancaria)
      REFERENCES proyecto_administrativo.cuentas_bancarias (id_cuenta_bancaria);

