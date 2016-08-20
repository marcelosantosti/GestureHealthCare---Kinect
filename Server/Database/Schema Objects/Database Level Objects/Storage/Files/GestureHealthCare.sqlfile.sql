ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [GestureHealthCare], FILENAME = 'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\GestureHealthCare.mdf', SIZE = 3072 KB, FILEGROWTH = 1024 KB) TO FILEGROUP [PRIMARY];



