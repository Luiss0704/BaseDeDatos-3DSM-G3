/*=====================================================

SQL-DQL en SQLServer
Archivo: 01-create-database.sql
Descripción: Crea la base de datos para el lenguaje SQL

=====================================================*/

USE master;
GO

IF DB_ID ('comercial_db') IS NOT NULL
BEGIN
    ALTER DATABASE comercial_db
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;
    DROP DATABASE comercial_db;
END;
GO


CREATE DATABASE comercial_db;
GO

USE comercial_db;
GO

PRINT 'La base de datos comercial_db se creó correctamente';
GO

-- SELECT DB_ID('comercial_db');