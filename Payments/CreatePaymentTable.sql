IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customer_payments]') AND type in (N'U'))
DROP TABLE [dbo].[customer_payments]
GO

/***** Object:  Table [dbo].[customer_payments]    Script Date: 9/27/2023 3:01:11 PM *****/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[customer_payments](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
	[package_id] [int] NOT NULL,
	[payment_title] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[payment_due_date] [date] NOT NULL,
	[payment_amount] [decimal](18, 0) NOT NULL,
	[payment_status] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[received_by] [int] NULL,
	[generation_date] [date] NULL,
	[sms_sent] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_payments] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[customer_payments] ADD  DEFAULT ('N') FOR [payment_status]
GO

