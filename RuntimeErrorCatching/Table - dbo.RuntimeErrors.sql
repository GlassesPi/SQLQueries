/****** Object:  Table [dbo].[RuntimeErrors] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RuntimeErrors](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemaName] [varchar](50) NULL,
	[ObjectName] [varchar](100) NULL,
	[ErrorNumber] [nvarchar](1500) NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[ErrorSeverity] [nvarchar](1500) NULL,
	[ErrorState] [nvarchar](1500) NULL,
	[ErrorProcedure] [nvarchar](max) NULL,
	[ErrorLine] [nvarchar](1500) NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_RuntimeErrors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

