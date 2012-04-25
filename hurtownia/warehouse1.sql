USE [master]
GO

/****** Object:  Database [warehouseheaven]    Script Date: 04/25/2012 19:46:17 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'warehouseheaven')
DROP DATABASE [warehouseheaven]
GO

USE [master]
GO

/****** Object:  Database [warehouseheaven]    Script Date: 04/25/2012 19:46:17 ******/
CREATE DATABASE [warehouseheaven] ON  PRIMARY 
( NAME = N'warehouseheaven', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\warehouseheaven.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'warehouseheaven_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\warehouseheaven_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [warehouseheaven] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [warehouseheaven].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [warehouseheaven] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [warehouseheaven] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [warehouseheaven] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [warehouseheaven] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [warehouseheaven] SET ARITHABORT OFF 
GO

ALTER DATABASE [warehouseheaven] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [warehouseheaven] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [warehouseheaven] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [warehouseheaven] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [warehouseheaven] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [warehouseheaven] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [warehouseheaven] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [warehouseheaven] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [warehouseheaven] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [warehouseheaven] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [warehouseheaven] SET  DISABLE_BROKER 
GO

ALTER DATABASE [warehouseheaven] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [warehouseheaven] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [warehouseheaven] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [warehouseheaven] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [warehouseheaven] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [warehouseheaven] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [warehouseheaven] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [warehouseheaven] SET  READ_WRITE 
GO

ALTER DATABASE [warehouseheaven] SET RECOVERY FULL 
GO

ALTER DATABASE [warehouseheaven] SET  MULTI_USER 
GO

ALTER DATABASE [warehouseheaven] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [warehouseheaven] SET DB_CHAINING OFF 
GO

