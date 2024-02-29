IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[client_packages]') AND type in (N'U'))
DROP TABLE [dbo].[client_packages]
GO

/***** Object:  Table [dbo].[client_packages]    Script Date: 9/27/2023 11:08:27 AM *****/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[client_packages](
	[package_id] [int] IDENTITY(1,1) NOT NULL,
	[package_name] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[package_price] [decimal](18, 0) NULL,
	[package_status] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[client_id] [int] NULL,
 CONSTRAINT [pk_packages] PRIMARY KEY CLUSTERED 
(
	[package_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO