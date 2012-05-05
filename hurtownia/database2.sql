USE [databaseheaven]
GO
/****** Object:  Table [dbo].[Kody_Bledow]    Script Date: 04/25/2012 19:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kody_Bledow](
	[id_Kod_Bledu] [int] IDENTITY(1,1) NOT NULL,
	[kod_bledu] [int] NOT NULL,
	[opis] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Kod_Bledu] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Uzytkownik]    Script Date: 04/25/2012 19:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Uzytkownik](
	[id_Uzytkownik] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](256) NOT NULL,
	[funkcja] [int] NOT NULL, /*1=admin systemu, 2=admin portu, 3=admin ladunkow, 4=celnik*/
	[haslo] [nchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Uzytkownik] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Typ_Ladunku]    Script Date: 04/25/2012 19:42:32 ******/
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
/****** Object:  Table [dbo].[Port]    Script Date: 04/25/2012 19:42:32 ******/
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
/****** Object:  Table [dbo].[Kraj]    Script Date: 04/25/2012 19:42:32 ******/
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
/****** Object:  Table [dbo].[Bledy_Operacji]    Script Date: 04/25/2012 19:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bledy_Operacji](
	[id_Bledy_Operacji] [int] IDENTITY(1,1) NOT NULL,
	[id_Kod_Bledu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Bledy_Operacji] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Towar]    Script Date: 04/25/2012 19:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Towar](
	[id_Towar] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](256) NOT NULL,
	[clo_jednostkowe] [int] NOT NULL,
	[wartosc_jednostkowa] [int] NOT NULL,
	[masa_jednostkowa] [float] NOT NULL,
	[objetosc_jednostkowa] [float] NOT NULL,
	[id_Typ_Ladunku] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Towar] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Terminal]    Script Date: 04/25/2012 19:42:32 ******/
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
/****** Object:  Table [dbo].[Kontrahent]    Script Date: 04/25/2012 19:42:32 ******/
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
/****** Object:  Table [dbo].[Magazyn]    Script Date: 04/25/2012 19:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Magazyn](
	[id_Magazyn] [int] IDENTITY(1,1) NOT NULL,
	[nazwa] [varchar](256) NOT NULL,
	[pojemnosc] [float] NOT NULL,
	[aktualna_objetosc_ladunkow] [float] NOT NULL,
	[cena_Za_Przechowanie] [int] NOT NULL,
	[id_Terminal] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Magazyn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ladunek]    Script Date: 04/25/2012 19:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ladunek](
	[id_Ladunek] [int] IDENTITY(1,1) NOT NULL,
	[ilosc] [int] NOT NULL,
	[id_Towar] [int] NOT NULL,
	[czy_kontrola_celna] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Ladunek] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dok]    Script Date: 04/25/2012 19:42:32 ******/
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
/****** Object:  Table [dbo].[Statek]    Script Date: 04/25/2012 19:42:32 ******/
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
	[aktualna_masa_ladunkow] [float] NOT NULL,
	[ladownosc_objetosciowa] [float] NOT NULL,
	[aktualna_objetosc_ladunkow] [float] NOT NULL,
	[dlugosc] [int] NOT NULL,
	[szerokosc] [int] NOT NULL,
	[wysokosc] [int] NOT NULL,
	[kapitan] [varchar](256) NOT NULL,
	[data_produkcji] [datetime] NOT NULL,
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
/****** Object:  Table [dbo].[Przeladunek]    Script Date: 04/25/2012 19:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Przeladunek](
	[id_Przeladunek] [int] IDENTITY(1,1) NOT NULL,
	[data] [datetime] NOT NULL,
	[uwagi] [text] NULL,
	[czy_aktualne_polozenie] [tinyint] NOT NULL,
	[id_Statek1] [int] NULL,
	[id_Statek2] [int] NULL,
	[id_Magazyn1] [int] NULL,
	[id_Magazyn2] [int] NULL,
	[id_Uzytkownik] [int] NULL,
	[id_Ladunek] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Przeladunek] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zadokowany]    Script Date: 04/25/2012 19:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zadokowany](
	[id_Zadokowany] [int] IDENTITY(1,1) NOT NULL,
	[data] [datetime] NOT NULL,
	[id_Uzytkownik] [int] NULL,
	[id_Dok] [int] NOT NULL,
	[id_Statek] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Zadokowany] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odbior_Ladunku]    Script Date: 04/25/2012 19:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odbior_Ladunku](
	[id_Odbior_Ladunku] [int] IDENTITY(1,1) NOT NULL,
	[data] [datetime] NOT NULL,
	[id_Kontrahent] [int] NOT NULL,
	[id_Ladunek] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Odbior_Ladunku] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nadanie_Ladunku]    Script Date: 04/25/2012 19:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nadanie_Ladunku](
	[id_Nadanie_Ladunku] [int] IDENTITY(1,1) NOT NULL,
	[data] [datetime] NOT NULL,
	[id_Kontrahent] [int] NOT NULL,
	[id_Ladunek] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Nadanie_Ladunku] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kontrola_Celna]    Script Date: 04/25/2012 19:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kontrola_Celna](
	[id_Kontrola_Celna] [int] IDENTITY(1,1) NOT NULL,
	[uwagi] [text] NULL,
	[czy_pozytywna] [tinyint] NOT NULL,
	[data] [datetime] NOT NULL,
	[id_Uzytkownik] [int] NULL,
	[id_Ladunek] [int] NOT NULL,
	[id_Terminal] [int] NOT NULL,
 CONSTRAINT [PK__Kontrola__1607E51B5629CD9C] PRIMARY KEY CLUSTERED 
(
	[id_Kontrola_Celna] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oplata]    Script Date: 04/25/2012 19:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oplata](
	[id_Oplata] [int] IDENTITY(1,1) NOT NULL,
	[typ] [int] NOT NULL, /*1=portowa, 2=celna*/
	[kwota] [int] NOT NULL,
	[czy_oplacona] [tinyint] NOT NULL,
	[data_naliczenia] [datetime] NOT NULL,
	[id_Kontrahent] [int] NOT NULL,
	[id_Uzytkownik] [int] NULL,
	[id_Ladunek] [int] NULL,
	[id_Zadokowany] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Oplata] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oddokowany]    Script Date: 04/25/2012 19:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oddokowany](
	[id_Oddokowany] [int] IDENTITY(1,1) NOT NULL,
	[data] [datetime] NOT NULL,
	[id_Zadokowany] [int] NOT NULL,
	[id_Uzytkownik] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Oddokowany] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF__Magazyn__aktualn__0CBAE877]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Magazyn] ADD  DEFAULT ((0)) FOR [aktualna_objetosc_ladunkow]
GO
/****** Object:  Default [DF__Przeladun__id_St__44FF419A]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Przeladunek] ADD  DEFAULT (NULL) FOR [id_Statek1]
GO
/****** Object:  Default [DF__Przeladun__id_St__45F365D3]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Przeladunek] ADD  DEFAULT (NULL) FOR [id_Statek2]
GO
/****** Object:  Default [DF__Przeladun__id_Ma__46E78A0C]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Przeladunek] ADD  DEFAULT (NULL) FOR [id_Magazyn1]
GO
/****** Object:  Default [DF__Przeladun__id_Ma__47DBAE45]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Przeladunek] ADD  DEFAULT (NULL) FOR [id_Magazyn2]
GO
/****** Object:  Default [DF__Statek__aktualna__15502E78]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Statek] ADD  DEFAULT ((0)) FOR [aktualna_masa_ladunkow]
GO
/****** Object:  Default [DF__Statek__aktualna__164452B1]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Statek] ADD  DEFAULT ((0)) FOR [aktualna_objetosc_ladunkow]
GO
/****** Object:  ForeignKey [FK__Bledy_Ope__id_Ko__619B8048]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Bledy_Operacji]  WITH CHECK ADD FOREIGN KEY([id_Kod_Bledu])
REFERENCES [dbo].[Kody_Bledow] ([id_Kod_Bledu])
GO
/****** Object:  ForeignKey [FK_Dok_Terminal]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Dok]  WITH CHECK ADD  CONSTRAINT [FK_Dok_Terminal] FOREIGN KEY([id_Terminal])
REFERENCES [dbo].[Terminal] ([id_Terminal])
GO
ALTER TABLE [dbo].[Dok] CHECK CONSTRAINT [FK_Dok_Terminal]
GO
/****** Object:  ForeignKey [FK_Kontrahent_Kraj]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Kontrahent]  WITH CHECK ADD  CONSTRAINT [FK_Kontrahent_Kraj] FOREIGN KEY([id_Kraj])
REFERENCES [dbo].[Kraj] ([id_Kraj])
GO
ALTER TABLE [dbo].[Kontrahent] CHECK CONSTRAINT [FK_Kontrahent_Kraj]
GO
/****** Object:  ForeignKey [FK__Kontrola___id_La__59063A47]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Kontrola_Celna]  WITH CHECK ADD  CONSTRAINT [FK__Kontrola___id_La__59063A47] FOREIGN KEY([id_Ladunek])
REFERENCES [dbo].[Ladunek] ([id_Ladunek])
GO
ALTER TABLE [dbo].[Kontrola_Celna] CHECK CONSTRAINT [FK__Kontrola___id_La__59063A47]
GO
/****** Object:  ForeignKey [FK__Kontrola___id_Uz__5812160E]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Kontrola_Celna]  WITH CHECK ADD  CONSTRAINT [FK__Kontrola___id_Uz__5812160E] FOREIGN KEY([id_Uzytkownik])
REFERENCES [dbo].[Uzytkownik] ([id_Uzytkownik])
GO
ALTER TABLE [dbo].[Kontrola_Celna] CHECK CONSTRAINT [FK__Kontrola___id_Uz__5812160E]
GO
/****** Object:  ForeignKey [FK_Kontrola_Celna_Kontrola_Celna]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Kontrola_Celna]  WITH CHECK ADD  CONSTRAINT [FK_Kontrola_Celna_Kontrola_Celna] FOREIGN KEY([id_Kontrola_Celna])
REFERENCES [dbo].[Kontrola_Celna] ([id_Kontrola_Celna])
GO
ALTER TABLE [dbo].[Kontrola_Celna] CHECK CONSTRAINT [FK_Kontrola_Celna_Kontrola_Celna]
GO
/****** Object:  ForeignKey [FK_Kontrola_Celna_Terminal]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Kontrola_Celna]  WITH CHECK ADD  CONSTRAINT [FK_Kontrola_Celna_Terminal] FOREIGN KEY([id_Terminal])
REFERENCES [dbo].[Terminal] ([id_Terminal])
GO
ALTER TABLE [dbo].[Kontrola_Celna] CHECK CONSTRAINT [FK_Kontrola_Celna_Terminal]
GO
/****** Object:  ForeignKey [FK__Ladunek__id_Towa__1ED998B2]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Ladunek]  WITH CHECK ADD FOREIGN KEY([id_Towar])
REFERENCES [dbo].[Towar] ([id_Towar])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK_Magazyn_Terminal]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Magazyn]  WITH CHECK ADD  CONSTRAINT [FK_Magazyn_Terminal] FOREIGN KEY([id_Terminal])
REFERENCES [dbo].[Terminal] ([id_Terminal])
GO
ALTER TABLE [dbo].[Magazyn] CHECK CONSTRAINT [FK_Magazyn_Terminal]
GO
/****** Object:  ForeignKey [FK_Nadanie_Ladunku_Kontrahent]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Nadanie_Ladunku]  WITH CHECK ADD  CONSTRAINT [FK_Nadanie_Ladunku_Kontrahent] FOREIGN KEY([id_Kontrahent])
REFERENCES [dbo].[Kontrahent] ([id_Kontrahent])
GO
ALTER TABLE [dbo].[Nadanie_Ladunku] CHECK CONSTRAINT [FK_Nadanie_Ladunku_Kontrahent]
GO
/****** Object:  ForeignKey [FK_Nadanie_Ladunku_Ladunek]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Nadanie_Ladunku]  WITH CHECK ADD  CONSTRAINT [FK_Nadanie_Ladunku_Ladunek] FOREIGN KEY([id_Ladunek])
REFERENCES [dbo].[Ladunek] ([id_Ladunek])
GO
ALTER TABLE [dbo].[Nadanie_Ladunku] CHECK CONSTRAINT [FK_Nadanie_Ladunku_Ladunek]
GO
/****** Object:  ForeignKey [FK__Odbior_La__id_Ko__276EDEB3]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Odbior_Ladunku]  WITH CHECK ADD  CONSTRAINT [FK__Odbior_La__id_Ko__276EDEB3] FOREIGN KEY([id_Kontrahent])
REFERENCES [dbo].[Kontrahent] ([id_Kontrahent])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Odbior_Ladunku] CHECK CONSTRAINT [FK__Odbior_La__id_Ko__276EDEB3]
GO
/****** Object:  ForeignKey [FK__Odbior_La__id_La__286302EC]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Odbior_Ladunku]  WITH CHECK ADD FOREIGN KEY([id_Ladunek])
REFERENCES [dbo].[Ladunek] ([id_Ladunek])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Oddokowan__id_Uz__534D60F1]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Oddokowany]  WITH CHECK ADD FOREIGN KEY([id_Uzytkownik])
REFERENCES [dbo].[Uzytkownik] ([id_Uzytkownik])
GO
/****** Object:  ForeignKey [FK__Oddokowan__id_Za__52593CB8]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Oddokowany]  WITH CHECK ADD FOREIGN KEY([id_Zadokowany])
REFERENCES [dbo].[Zadokowany] ([id_Zadokowany])
GO
/****** Object:  ForeignKey [FK__Oplata__id_Kontr__33D4B598]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Oplata]  WITH CHECK ADD  CONSTRAINT [FK__Oplata__id_Kontr__33D4B598] FOREIGN KEY([id_Kontrahent])
REFERENCES [dbo].[Kontrahent] ([id_Kontrahent])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Oplata] CHECK CONSTRAINT [FK__Oplata__id_Kontr__33D4B598]
GO
/****** Object:  ForeignKey [FK__Oplata__id_Uzytk__34C8D9D1]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Oplata]  WITH CHECK ADD FOREIGN KEY([id_Uzytkownik])
REFERENCES [dbo].[Uzytkownik] ([id_Uzytkownik])
ON DELETE SET NULL
GO
/****** Object:  ForeignKey [FK_Oplata_Statek]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Oplata]  WITH CHECK ADD  CONSTRAINT [FK_Oplata_Statek] FOREIGN KEY([id_Zadokowany])
REFERENCES [dbo].[Zadokowany] ([id_Zadokowany])
GO
ALTER TABLE [dbo].[Oplata] CHECK CONSTRAINT [FK_Oplata_Statek]
GO
/****** Object:  ForeignKey [FK_Oplata_Typ_Oplaty]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Oplata]  WITH CHECK ADD  CONSTRAINT [FK_Oplata_Typ_Oplaty] FOREIGN KEY([id_Ladunek])
REFERENCES [dbo].[Ladunek] ([id_Ladunek])
GO
ALTER TABLE [dbo].[Oplata] CHECK CONSTRAINT [FK_Oplata_Typ_Oplaty]
GO
/****** Object:  ForeignKey [FK__Przeladun__id_La__48CFD27E]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Przeladunek]  WITH CHECK ADD FOREIGN KEY([id_Ladunek])
REFERENCES [dbo].[Ladunek] ([id_Ladunek])
GO
/****** Object:  ForeignKey [FK__Przeladun__id_Ma__4BAC3F29]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Przeladunek]  WITH CHECK ADD FOREIGN KEY([id_Magazyn1])
REFERENCES [dbo].[Magazyn] ([id_Magazyn])
GO
/****** Object:  ForeignKey [FK__Przeladun__id_Ma__4CA06362]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Przeladunek]  WITH CHECK ADD FOREIGN KEY([id_Magazyn2])
REFERENCES [dbo].[Magazyn] ([id_Magazyn])
GO
/****** Object:  ForeignKey [FK__Przeladun__id_St__49C3F6B7]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Przeladunek]  WITH CHECK ADD FOREIGN KEY([id_Statek1])
REFERENCES [dbo].[Statek] ([id_Statek])
GO
/****** Object:  ForeignKey [FK__Przeladun__id_St__4AB81AF0]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Przeladunek]  WITH CHECK ADD FOREIGN KEY([id_Statek2])
REFERENCES [dbo].[Statek] ([id_Statek])
GO
/****** Object:  ForeignKey [FK__Przeladun__id_Uz__4D94879B]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Przeladunek]  WITH CHECK ADD FOREIGN KEY([id_Uzytkownik])
REFERENCES [dbo].[Uzytkownik] ([id_Uzytkownik])
GO
/****** Object:  ForeignKey [FK_Statek_Kontrahent]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Statek]  WITH CHECK ADD  CONSTRAINT [FK_Statek_Kontrahent] FOREIGN KEY([id_Kontrahent])
REFERENCES [dbo].[Kontrahent] ([id_Kontrahent])
GO
ALTER TABLE [dbo].[Statek] CHECK CONSTRAINT [FK_Statek_Kontrahent]
GO
/****** Object:  ForeignKey [FK_Statek_Typ_Ladunku]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Statek]  WITH CHECK ADD  CONSTRAINT [FK_Statek_Typ_Ladunku] FOREIGN KEY([id_Typ_Ladunku])
REFERENCES [dbo].[Typ_Ladunku] ([id_Typ_Ladunku])
GO
ALTER TABLE [dbo].[Statek] CHECK CONSTRAINT [FK_Statek_Typ_Ladunku]
GO
/****** Object:  ForeignKey [FK_Terminal_Port]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Terminal]  WITH CHECK ADD  CONSTRAINT [FK_Terminal_Port] FOREIGN KEY([id_Port])
REFERENCES [dbo].[Port] ([id_Port])
GO
ALTER TABLE [dbo].[Terminal] CHECK CONSTRAINT [FK_Terminal_Port]
GO
/****** Object:  ForeignKey [FK_Terminal_Typ_Ladunku]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Terminal]  WITH CHECK ADD  CONSTRAINT [FK_Terminal_Typ_Ladunku] FOREIGN KEY([id_Typ_Ladunku])
REFERENCES [dbo].[Typ_Ladunku] ([id_Typ_Ladunku])
GO
ALTER TABLE [dbo].[Terminal] CHECK CONSTRAINT [FK_Terminal_Typ_Ladunku]
GO
/****** Object:  ForeignKey [FK_Towar_Typ_Ladunku]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Towar]  WITH CHECK ADD  CONSTRAINT [FK_Towar_Typ_Ladunku] FOREIGN KEY([id_Typ_Ladunku])
REFERENCES [dbo].[Typ_Ladunku] ([id_Typ_Ladunku])
GO
ALTER TABLE [dbo].[Towar] CHECK CONSTRAINT [FK_Towar_Typ_Ladunku]
GO
/****** Object:  ForeignKey [FK__Zadokowan__id_Do__2D27B809]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Zadokowany]  WITH CHECK ADD FOREIGN KEY([id_Dok])
REFERENCES [dbo].[Dok] ([id_Dok])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Zadokowan__id_St__2F10007B]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Zadokowany]  WITH CHECK ADD FOREIGN KEY([id_Statek])
REFERENCES [dbo].[Statek] ([id_Statek])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK__Zadokowan__id_Uz__2E1BDC42]    Script Date: 04/25/2012 19:42:32 ******/
ALTER TABLE [dbo].[Zadokowany]  WITH CHECK ADD FOREIGN KEY([id_Uzytkownik])
REFERENCES [dbo].[Uzytkownik] ([id_Uzytkownik])
ON DELETE SET NULL
GO
