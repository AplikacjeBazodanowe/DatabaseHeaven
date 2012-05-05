
USE [master] 
GO 
/****** Object: Database [databaseheaven] Script Date: 04/25/2012 19:46:05 ******/ 
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'databaseheaven') 
DROP DATABASE [databaseheaven] 
GO 
USE [master] 
GO 
/****** Object: Database [databaseheaven] Script Date: 04/25/2012 19:46:05 ******/ 
CREATE DATABASE [databaseheaven] ON PRIMARY 
( NAME = N'databaseheaven', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\databaseheaven.mdf' , SIZE = 5072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ) 
LOG ON 
( NAME = N'databaseheaven_log', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\databaseheaven_log.ldf' , SIZE = 5024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%) 
GO

USE [master]
GO
