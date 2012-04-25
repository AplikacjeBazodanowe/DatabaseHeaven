USE [warehouseheaven]
GO
/****** Object:  Table [dbo].[Typ_Ladunku]    Script Date: 04/25/2012 19:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Typ_Ladunku](
	[id_Typ_Ladunku] [int] IDENTITY(1,1) NOT NULL,
	[typ_Statku] [varchar](256) NOT NULL,
	[nazwa_Typu_Ladunku] [varchar](256) NOT NULL,
	[typ_Terminala] [varchar](256) NOT NULL,
	[jednostka_Masy] [varchar](256) NOT NULL,
	[jednostka_Objetosci] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Typ_Ladunku] PRIMARY KEY CLUSTERED 
(
	[id_Typ_Ladunku] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Port]    Script Date: 04/25/2012 19:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Port](
	[id_Port] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](256) NOT NULL,
	[adres] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Port] PRIMARY KEY CLUSTERED 
(
	[id_Port] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kraj]    Script Date: 04/25/2012 19:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kraj](
	[id_Kraj] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Kraj] PRIMARY KEY CLUSTERED 
(
	[id_Kraj] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kontrahent]    Script Date: 04/25/2012 19:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kontrahent](
	[id_Kontrahent] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](256) NOT NULL,
	[adres] [varchar](256) NOT NULL,
	[typ] [int] NOT NULL, /*1=armator, 2=wlasciciel ladunku*/
	[id_Kraj] [int] NOT NULL,
 CONSTRAINT [PK_Kontrahent] PRIMARY KEY CLUSTERED 
(
	[id_Kontrahent] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Towar]    Script Date: 04/25/2012 19:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Towar](
	[id_Towar] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](256) NOT NULL,
	[id_Typ_Ladunku] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Towar] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Terminal]    Script Date: 04/25/2012 19:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Terminal](
	[id_Terminal] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](255) NOT NULL,
	[id_Typ_Ladunku] [int] NOT NULL,
	[id_Port] [int] NOT NULL,
 CONSTRAINT [PK_Terminal] PRIMARY KEY CLUSTERED 
(
	[id_Terminal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Obsluga_Ladunku]    Script Date: 04/25/2012 19:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obsluga_Ladunku](
	[id_Obsluga_Ladunku] [int] IDENTITY(1,1) NOT NULL,
	[data_nadania] [datetime] NOT NULL,
	[data_odbioru] [datetime] NOT NULL,
	[ilosc] [int] NOT NULL,
	[wartosc] [int] NOT NULL,
	[masa] [int] NOT NULL,
	[objetosc] [int] NOT NULL,
	[oplata] [int] NOT NULL,
	[id_Towar] [int] NOT NULL,
 CONSTRAINT [PK_Obsluga_Ladunku] PRIMARY KEY CLUSTERED 
(
	[id_Obsluga_Ladunku] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statek]    Script Date: 04/25/2012 19:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Statek](
	[id_Statek] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](256) NOT NULL,
	[wypornosc] [int] NOT NULL,
	[ladownosc_masowa] [float] NOT NULL,
	[ladownosc_objetosciowa] [float] NOT NULL,
	[dlugosc] [int] NOT NULL,
	[szerokosc] [int] NOT NULL,
	[wysokosc] [int] NOT NULL,
	[kapitan] [varchar](256) NOT NULL,
	[data_produkcji] [date] NOT NULL,
	[id_Kontrahent] [int] NOT NULL,
	[id_Typ_Ladunku] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Statek] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dok]    Script Date: 04/25/2012 19:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dok](
	[id_Dok] [int] IDENTITY(1,1) NOT NULL,
	[maks_dlugosc_statku] [int] NOT NULL,
	[maks_szerokosc_statku] [int] NOT NULL,
	[maks_wysokosc_statku] [int] NOT NULL,
	[cena_za_pobyt] [int] NOT NULL,
	[id_Terminal] [int] NOT NULL,
 CONSTRAINT [PK_Dok] PRIMARY KEY CLUSTERED 
(
	[id_Dok] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kontrola_Celna]    Script Date: 04/25/2012 19:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kontrola_Celna](
	[id_Kontrola_Celna] [int] IDENTITY(1,1) NOT NULL,
	[data] [datetime] NOT NULL,
	[czy_pozytywna] [tinyint] NOT NULL,
	[oplata] [int] NOT NULL,
	[id_Towar] [int] NOT NULL,
	[id_Terminal] [int] NOT NULL,
 CONSTRAINT [PK_Kontrola_Celna] PRIMARY KEY CLUSTERED 
(
	[id_Kontrola_Celna] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pobyt_Statku]    Script Date: 04/25/2012 19:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pobyt_Statku](
	[id_Pobyt_Statku] [int] IDENTITY(1,1) NOT NULL,
	[data_zadokowania] [datetime] NOT NULL,
	[data_oddokowania] [datetime] NOT NULL,
	[oplata] [int] NOT NULL,
	[id_Statek] [int] NOT NULL,
	[id_Dok] [int] NOT NULL,
	[id_Kontrahent] [int] NOT NULL,
 CONSTRAINT [PK_Pobyt_Statku] PRIMARY KEY CLUSTERED 
(
	[id_Pobyt_Statku] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Dok_Terminal]    Script Date: 04/25/2012 19:48:27 ******/
ALTER TABLE [dbo].[Dok]  WITH CHECK ADD  CONSTRAINT [FK_Dok_Terminal] FOREIGN KEY([id_Terminal])
REFERENCES [dbo].[Terminal] ([id_Terminal])
GO
ALTER TABLE [dbo].[Dok] CHECK CONSTRAINT [FK_Dok_Terminal]
GO
/****** Object:  ForeignKey [FK_Kontrahent_Kraj]    Script Date: 04/25/2012 19:48:27 ******/
ALTER TABLE [dbo].[Kontrahent]  WITH CHECK ADD  CONSTRAINT [FK_Kontrahent_Kraj] FOREIGN KEY([id_Kraj])
REFERENCES [dbo].[Kraj] ([id_Kraj])
GO
ALTER TABLE [dbo].[Kontrahent] CHECK CONSTRAINT [FK_Kontrahent_Kraj]
GO
/****** Object:  ForeignKey [FK_Kontrola_Celna_Terminal]    Script Date: 04/25/2012 19:48:27 ******/
ALTER TABLE [dbo].[Kontrola_Celna]  WITH CHECK ADD  CONSTRAINT [FK_Kontrola_Celna_Terminal] FOREIGN KEY([id_Terminal])
REFERENCES [dbo].[Terminal] ([id_Terminal])
GO
ALTER TABLE [dbo].[Kontrola_Celna] CHECK CONSTRAINT [FK_Kontrola_Celna_Terminal]
GO
/****** Object:  ForeignKey [FK_Kontrola_Celna_Towar]    Script Date: 04/25/2012 19:48:27 ******/
ALTER TABLE [dbo].[Kontrola_Celna]  WITH CHECK ADD  CONSTRAINT [FK_Kontrola_Celna_Towar] FOREIGN KEY([id_Towar])
REFERENCES [dbo].[Towar] ([id_Towar])
GO
ALTER TABLE [dbo].[Kontrola_Celna] CHECK CONSTRAINT [FK_Kontrola_Celna_Towar]
GO
/****** Object:  ForeignKey [FK_Obsluga_Ladunku_Towar]    Script Date: 04/25/2012 19:48:27 ******/
ALTER TABLE [dbo].[Obsluga_Ladunku]  WITH CHECK ADD  CONSTRAINT [FK_Obsluga_Ladunku_Towar] FOREIGN KEY([id_Towar])
REFERENCES [dbo].[Towar] ([id_Towar])
GO
ALTER TABLE [dbo].[Obsluga_Ladunku] CHECK CONSTRAINT [FK_Obsluga_Ladunku_Towar]
GO
/****** Object:  ForeignKey [FK_Pobyt_Statku_Dok]    Script Date: 04/25/2012 19:48:27 ******/
ALTER TABLE [dbo].[Pobyt_Statku]  WITH CHECK ADD  CONSTRAINT [FK_Pobyt_Statku_Dok] FOREIGN KEY([id_Dok])
REFERENCES [dbo].[Dok] ([id_Dok])
GO
ALTER TABLE [dbo].[Pobyt_Statku] CHECK CONSTRAINT [FK_Pobyt_Statku_Dok]
GO
/****** Object:  ForeignKey [FK_Pobyt_Statku_Kontrahent]    Script Date: 04/25/2012 19:48:27 ******/
ALTER TABLE [dbo].[Pobyt_Statku]  WITH CHECK ADD  CONSTRAINT [FK_Pobyt_Statku_Kontrahent] FOREIGN KEY([id_Kontrahent])
REFERENCES [dbo].[Kontrahent] ([id_Kontrahent])
GO
ALTER TABLE [dbo].[Pobyt_Statku] CHECK CONSTRAINT [FK_Pobyt_Statku_Kontrahent]
GO
/****** Object:  ForeignKey [FK_Pobyt_Statku_Statek]    Script Date: 04/25/2012 19:48:27 ******/
ALTER TABLE [dbo].[Pobyt_Statku]  WITH CHECK ADD  CONSTRAINT [FK_Pobyt_Statku_Statek] FOREIGN KEY([id_Statek])
REFERENCES [dbo].[Statek] ([id_Statek])
GO
ALTER TABLE [dbo].[Pobyt_Statku] CHECK CONSTRAINT [FK_Pobyt_Statku_Statek]
GO
/****** Object:  ForeignKey [FK_Statek_Kontrahent]    Script Date: 04/25/2012 19:48:27 ******/
ALTER TABLE [dbo].[Statek]  WITH CHECK ADD  CONSTRAINT [FK_Statek_Kontrahent] FOREIGN KEY([id_Kontrahent])
REFERENCES [dbo].[Kontrahent] ([id_Kontrahent])
GO
ALTER TABLE [dbo].[Statek] CHECK CONSTRAINT [FK_Statek_Kontrahent]
GO
/****** Object:  ForeignKey [FK_Statek_Typ_Ladunku]    Script Date: 04/25/2012 19:48:27 ******/
ALTER TABLE [dbo].[Statek]  WITH CHECK ADD  CONSTRAINT [FK_Statek_Typ_Ladunku] FOREIGN KEY([id_Typ_Ladunku])
REFERENCES [dbo].[Typ_Ladunku] ([id_Typ_Ladunku])
GO
ALTER TABLE [dbo].[Statek] CHECK CONSTRAINT [FK_Statek_Typ_Ladunku]
GO
/****** Object:  ForeignKey [FK_Terminal_Port]    Script Date: 04/25/2012 19:48:27 ******/
ALTER TABLE [dbo].[Terminal]  WITH CHECK ADD  CONSTRAINT [FK_Terminal_Port] FOREIGN KEY([id_Port])
REFERENCES [dbo].[Port] ([id_Port])
GO
ALTER TABLE [dbo].[Terminal] CHECK CONSTRAINT [FK_Terminal_Port]
GO
/****** Object:  ForeignKey [FK_Terminal_Typ_Ladunku]    Script Date: 04/25/2012 19:48:27 ******/
ALTER TABLE [dbo].[Terminal]  WITH CHECK ADD  CONSTRAINT [FK_Terminal_Typ_Ladunku] FOREIGN KEY([id_Typ_Ladunku])
REFERENCES [dbo].[Typ_Ladunku] ([id_Typ_Ladunku])
GO
ALTER TABLE [dbo].[Terminal] CHECK CONSTRAINT [FK_Terminal_Typ_Ladunku]
GO
/****** Object:  ForeignKey [FK_Towar_Typ_Ladunku]    Script Date: 04/25/2012 19:48:27 ******/
ALTER TABLE [dbo].[Towar]  WITH CHECK ADD  CONSTRAINT [FK_Towar_Typ_Ladunku] FOREIGN KEY([id_Typ_Ladunku])
REFERENCES [dbo].[Typ_Ladunku] ([id_Typ_Ladunku])
GO
ALTER TABLE [dbo].[Towar] CHECK CONSTRAINT [FK_Towar_Typ_Ladunku]
GO
