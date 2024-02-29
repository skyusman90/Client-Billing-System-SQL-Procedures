/***** Object:  Table [dbo].[clients]    Script Date: 9/22/2023 11:13:03 AM *****/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[clients]') AND type in (N'U'))
DROP TABLE [dbo].[clients]
GO

/***** Object:  Table [dbo].[clients]    Script Date: 9/22/2023 11:13:03 AM *****/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[clients](
	[client_id] [int] IDENTITY(1,1) NOT NULL,
	[client_name] [varchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[client_username] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[client_password] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[client_mobilenum] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[client_status] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_clients] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_PADDING ON
GO

/***** Object:  Index [ix_username]    Script Date: 9/22/2023 11:13:03 AM *****/
CREATE UNIQUE NONCLUSTERED INDEX [ix_username] ON [dbo].[clients]
(
	[client_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [dbo].[clients] ADD  DEFAULT ('Y') FOR [client_status]
GO


