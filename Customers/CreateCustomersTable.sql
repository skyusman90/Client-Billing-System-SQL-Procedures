IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[client_customers]') AND type in (N'U'))
DROP TABLE [dbo].[client_customers]
GO

/***** Object:  Table [dbo].[client_customers]    Script Date: 9/22/2023 2:49:51 PM *****/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[client_customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id_external] [int] NULL,
	[client_id] [int] NULL,
	[customer_name] [varchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[customer_user_name] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[customer_cnic] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cusotmer_mobilenum] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[customer_address] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[package_id] [int] NULL,
	[customer_due_day] [int] NULL,
	[join_date] [date] NULL,
	[customer_status] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_customers] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[client_customers] ADD  DEFAULT ('N') FOR [customer_status]
GO
