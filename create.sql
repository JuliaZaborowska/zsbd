USE [zbsd]
GO
/****** Object:  Table [dbo].[Grupa]    Script Date: 04.06.2018 11:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grupa](
	[id] [int] NOT NULL,
	[nazwa] [varchar](500) NOT NULL,
	[opis] [varchar](5000) NULL,
 CONSTRAINT [PK_Grupa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grupa-Czlonek_Grupy]    Script Date: 04.06.2018 11:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupa-Czlonek_Grupy](
	[id_grupy] [int] NOT NULL,
	[id_czlonka_grupy] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grupa-Post]    Script Date: 04.06.2018 11:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupa-Post](
	[id_grupy] [int] NOT NULL,
	[id_postu] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Komentarz]    Script Date: 04.06.2018 11:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Komentarz](
	[id] [int] NOT NULL,
	[tresc] [varchar](1000) NOT NULL,
	[id_autora] [int] NOT NULL,
	[data] [date] NOT NULL,
	[id_postu] [int] NOT NULL,
 CONSTRAINT [PK_Komentarz] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post]    Script Date: 04.06.2018 11:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[id_autora] [int] NOT NULL,
	[tresc] [varchar](5000) NOT NULL,
	[data] [date] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Uzytkownik]    Script Date: 04.06.2018 11:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Uzytkownik](
	[id] [int] NOT NULL,
	[login] [varchar](20) NOT NULL,
	[haslo] [char](64) NOT NULL,
	[imie] [varchar](40) NOT NULL,
	[nazwisko] [varchar](40) NOT NULL,
	[telefon] [varchar](20) NULL,
	[data_urodzenia] [date] NULL,
	[plec] [varchar](40) NULL,
	[miasto] [varchar](40) NULL,
	[miejsce_pracy] [varchar](40) NULL,
 CONSTRAINT [PK_Uzytkownik] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Wiadomosc]    Script Date: 04.06.2018 11:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Wiadomosc](
	[id_wiadomosci] [int] NULL,
	[tresc] [varchar](1000) NULL,
	[data_wyslania] [date] NULL,
	[czy_odczytano] [bit] NULL,
	[id_nadawcy] [int] NULL,
	[id_odbiorcy] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Znajomi]    Script Date: 04.06.2018 11:50:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Znajomi](
	[id_uzytkownika_1] [int] NULL,
	[id_uzytkownika_2] [int] NULL,
	[data_zawarcia_znajomosci] [date] NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Grupa-Czlonek_Grupy]  WITH CHECK ADD  CONSTRAINT [FK_Grupa-Czlonek_Grupy_Grupa] FOREIGN KEY([id_grupy])
REFERENCES [dbo].[Grupa] ([id])
GO
ALTER TABLE [dbo].[Grupa-Czlonek_Grupy] CHECK CONSTRAINT [FK_Grupa-Czlonek_Grupy_Grupa]
GO
ALTER TABLE [dbo].[Grupa-Czlonek_Grupy]  WITH CHECK ADD  CONSTRAINT [FK_Grupa-Czlonek_Grupy_Uzytkownik] FOREIGN KEY([id_czlonka_grupy])
REFERENCES [dbo].[Uzytkownik] ([id])
GO
ALTER TABLE [dbo].[Grupa-Czlonek_Grupy] CHECK CONSTRAINT [FK_Grupa-Czlonek_Grupy_Uzytkownik]
GO
ALTER TABLE [dbo].[Grupa-Post]  WITH CHECK ADD  CONSTRAINT [FK_Grupa-Post_Grupa] FOREIGN KEY([id_grupy])
REFERENCES [dbo].[Grupa] ([id])
GO
ALTER TABLE [dbo].[Grupa-Post] CHECK CONSTRAINT [FK_Grupa-Post_Grupa]
GO
ALTER TABLE [dbo].[Grupa-Post]  WITH CHECK ADD  CONSTRAINT [FK_Grupa-Post_Post] FOREIGN KEY([id_postu])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[Grupa-Post] CHECK CONSTRAINT [FK_Grupa-Post_Post]
GO
ALTER TABLE [dbo].[Komentarz]  WITH CHECK ADD  CONSTRAINT [FK_Komentarz_Post] FOREIGN KEY([id_postu])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[Komentarz] CHECK CONSTRAINT [FK_Komentarz_Post]
GO
ALTER TABLE [dbo].[Komentarz]  WITH CHECK ADD  CONSTRAINT [FK_Komentarz_Uzytkownik] FOREIGN KEY([id_autora])
REFERENCES [dbo].[Uzytkownik] ([id])
GO
ALTER TABLE [dbo].[Komentarz] CHECK CONSTRAINT [FK_Komentarz_Uzytkownik]
GO
ALTER TABLE [dbo].[Wiadomosc]  WITH CHECK ADD  CONSTRAINT [FK_Wiadomosc_Uzytkownik] FOREIGN KEY([id_nadawcy])
REFERENCES [dbo].[Uzytkownik] ([id])
GO
ALTER TABLE [dbo].[Wiadomosc] CHECK CONSTRAINT [FK_Wiadomosc_Uzytkownik]
GO
ALTER TABLE [dbo].[Wiadomosc]  WITH CHECK ADD  CONSTRAINT [FK_Wiadomosc_Uzytkownik1] FOREIGN KEY([id_odbiorcy])
REFERENCES [dbo].[Uzytkownik] ([id])
GO
ALTER TABLE [dbo].[Wiadomosc] CHECK CONSTRAINT [FK_Wiadomosc_Uzytkownik1]
GO
ALTER TABLE [dbo].[Znajomi]  WITH CHECK ADD  CONSTRAINT [FK_Znajomi_Uzytkownik] FOREIGN KEY([id_uzytkownika_1])
REFERENCES [dbo].[Uzytkownik] ([id])
GO
ALTER TABLE [dbo].[Znajomi] CHECK CONSTRAINT [FK_Znajomi_Uzytkownik]
GO
ALTER TABLE [dbo].[Znajomi]  WITH CHECK ADD  CONSTRAINT [FK_Znajomi_Uzytkownik1] FOREIGN KEY([id_uzytkownika_2])
REFERENCES [dbo].[Uzytkownik] ([id])
GO
ALTER TABLE [dbo].[Znajomi] CHECK CONSTRAINT [FK_Znajomi_Uzytkownik1]
GO
