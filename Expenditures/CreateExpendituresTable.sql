
/***** Object:  Table [dbo].[client_expenditures]    Script Date: 10/2/2023 12:09:10 PM *****/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[client_expenditures](
	[expenditure_id] [int] IDENTITY(1,1) NOT NULL,
	[client_id] [int] NOT NULL,
	[expenditure_title] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[expenditure_details] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[expenditure_type] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[expenditure_amount] [decimal](18, 0) NOT NULL,
	[expenditure_date] [date] NOT NULL,
	[expenditure_status] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [pk_expenditure] PRIMARY KEY CLUSTERED 
(
	[expenditure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

