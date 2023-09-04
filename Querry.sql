-- Crear la base de datos BDCrudTest
CREATE DATABASE BDCrudTest;

-- Usar la base de datos BDCrudTest
USE BDCrudTest;

-- Crear la tabla coCategoria
CREATE TABLE coCategoria (
    nIdCategori INT PRIMARY KEY,
    cNombCateg VARCHAR(255),
    cEsActiva CHAR(1)
);

-- Crear la tabla coProducto
CREATE TABLE coProducto (
    nIdProduct INT PRIMARY KEY,
    cNombProdu VARCHAR(255),
    nPrecioProd DECIMAL(10, 2),
    nIdCategori INT,
    FOREIGN KEY (nIdCategori) REFERENCES coCategoria(nIdCategori)
);

-- Insertar categorías
INSERT INTO coCategoria (nIdCategori, cNombCateg, cEsActiva)
VALUES
    (1, 'Herramientas de Diseño', 'S'),
    (2, 'Software de Productividad', 'S'),
    (3, 'Software Libre', 'S');

-- Insertar productos de software
INSERT INTO coProducto (nIdProduct, cNombProdu, nPrecioProd, nIdCategori)
VALUES
    (1, 'Adobe Photoshop', 299.99, 1),
    (2, 'CorelDRAW', 249.99, 1),
    (3, 'Microsoft Office', 129.99, 2),
    (4, 'Adobe Acrobat Pro', 199.99, 2),
    (5, 'AutoCAD', 499.99, 1),
    (6, 'Visual Studio', 199.99, 2);






CREATE PROCEDURE Usp_Sel_Co_Productos
AS
BEGIN
    SELECT p.nIdProduct, p.cNombProdu, p.nPrecioProd, c.cNombCateg
    FROM coProducto p
    INNER JOIN coCategoria c ON p.nIdCategori = c.nIdCategori;
END



CREATE PROCEDURE Usp_Ins_Co_Categoria
(
    @IDCategoria INT,
    @NombreCategoria NVARCHAR(255),
    @Activa NVARCHAR(1)  -- Debe ser NVARCHAR para aceptar "S" o "N"
)
AS
BEGIN
    -- Verificar si el ID de categoría ya está en uso
    IF NOT EXISTS (SELECT 1 FROM coCategoria WHERE nIdCategori = @IDCategoria)
    BEGIN
        -- Si no existe, insertar los datos en la tabla
        INSERT INTO coCategoria (nIdCategori, cNombCateg, cEsActiva)
        VALUES (@IDCategoria, @NombreCategoria, @Activa)

        PRINT 'Datos de categoría insertados con éxito.'
    END
    ELSE
    BEGIN
        PRINT 'El ID de categoría ya está en uso. No se puede insertar.'
    END
END




CREATE PROCEDURE Usp_Get_Co_Categoria_By_Id
    @idCategoria INT
AS
BEGIN
    SELECT [nIdCategori], [cNombCateg], [cEsActiva]
    FROM [coCategoria]
    WHERE [nIdCategori] = @idCategoria;
END




CREATE PROCEDURE Usp_Edit_Co_Categoria
    @nIdCategoria INT,
    @cNombCateg NVARCHAR(255),
    @cEsActiva NVARCHAR(1)
AS
BEGIN
    UPDATE [BDCrudTest].[dbo].[coCategoria]
    SET
        [cNombCateg] = @cNombCateg,
        [cEsActiva] = @cEsActiva
    WHERE
        [nIdCategori] = @nIdCategoria;
END




CREATE PROCEDURE Usp_Get_All_Co_Categorias
AS
BEGIN
    SELECT 
        [nIdCategori],
        [cNombCateg],
        [cEsActiva]
    FROM [BDCrudTest].[dbo].[coCategoria];
END

GO

-- Verificar si el procedimiento existe y eliminarlo si es necesario
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'Usp_Del_Co_Categoria')
    DROP PROCEDURE [dbo].[Usp_Del_Co_Categoria]
GO




-- Crear el procedimiento almacenado
CREATE PROCEDURE [dbo].[Usp_Del_Co_Categoria]
    @nIdCategoria INT
AS
BEGIN
    DELETE FROM coCategoria
    WHERE nIdCategori = @nIdCategoria;
END