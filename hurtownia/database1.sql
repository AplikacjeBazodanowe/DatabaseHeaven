USE [master]
GO

/****** Object:  Database [databaseheaven]    Script Date: 04/25/2012 19:46:05 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'databaseheaven')
DROP DATABASE [databaseheaven]
GO

USE [master]
GO

/****** Object:  Database [databaseheaven]    Script Date: 04/25/2012 19:46:05 ******/
CREATE DATABASE [databaseheaven] ON  PRIMARY 
( NAME = N'databaseheaven', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\databaseheaven.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'databaseheaven_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\databaseheaven_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [databaseheaven] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [databaseheaven].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [databaseheaven] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [databaseheaven] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [databaseheaven] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [databaseheaven] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [databaseheaven] SET ARITHABORT OFF 
GO

ALTER DATABASE [databaseheaven] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [databaseheaven] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [databaseheaven] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [databaseheaven] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [databaseheaven] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [databaseheaven] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [databaseheaven] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [databaseheaven] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [databaseheaven] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [databaseheaven] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [databaseheaven] SET  DISABLE_BROKER 
GO

ALTER DATABASE [databaseheaven] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [databaseheaven] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [databaseheaven] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [databaseheaven] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [databaseheaven] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [databaseheaven] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [databaseheaven] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [databaseheaven] SET  READ_WRITE 
GO

ALTER DATABASE [databaseheaven] SET RECOVERY FULL 
GO

ALTER DATABASE [databaseheaven] SET  MULTI_USER 
GO

ALTER DATABASE [databaseheaven] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [databaseheaven] SET DB_CHAINING OFF 
GO

