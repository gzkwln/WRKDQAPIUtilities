USE [WRKDQAPIUtilities]
GO
SET IDENTITY_INSERT [dbo].[ApiResults] ON 
GO
INSERT [dbo].[ApiResults] ([Id], [URLExtension], [JsonData], [CreatedAt]) VALUES (248, N'rules', N'', CAST(N'2026-11-13T14:48:37.300' AS DateTime))
GO
INSERT [dbo].[ApiResults] ([Id], [URLExtension], [JsonData], [CreatedAt]) VALUES (249, N'categories', N'', CAST(N'2026-11-13T14:48:37.453' AS DateTime))
GO
INSERT [dbo].[ApiResults] ([Id], [URLExtension], [JsonData], [CreatedAt]) VALUES (250, N'data-quality-jobs', N'', CAST(N'2026-11-13T14:48:41.363' AS DateTime))
GO
INSERT [dbo].[ApiResults] ([Id], [URLExtension], [JsonData], [CreatedAt]) VALUES (251, N'datastores', N'', CAST(N'2026-11-13T14:48:41.543' AS DateTime))
GO
INSERT [dbo].[ApiResults] ([Id], [URLExtension], [JsonData], [CreatedAt]) VALUES (252, N'enforcements', N'', CAST(N'2026-11-13T14:48:42.293' AS DateTime))
GO
INSERT [dbo].[ApiResults] ([Id], [URLExtension], [JsonData], [CreatedAt]) VALUES (253, N'implementations', N'', CAST(N'2026-11-13T14:48:44.113' AS DateTime))
GO
INSERT [dbo].[ApiResults] ([Id], [URLExtension], [JsonData], [CreatedAt]) VALUES (254, N'subject-areas', N'', CAST(N'2026-11-13T14:48:44.287' AS DateTime))
GO
INSERT [dbo].[ApiResults] ([Id], [URLExtension], [JsonData], [CreatedAt]) VALUES (255, N'systems', N'', CAST(N'2026-11-13T14:48:44.580' AS DateTime))
GO
INSERT [dbo].[ApiResults] ([Id], [URLExtension], [JsonData], [CreatedAt]) VALUES (256, N'users', N'', CAST(N'2026-11-13T14:48:44.753' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ApiResults] OFF
GO
INSERT [dbo].[GETAPIRESULTS] ([ExtractID], [URL], [URLEXTENSION], [TENANTID], [LastUpdate], [TABLENAME], [GETRESULTS], [APIUsername], [APIPassword], [APIPassword_BAK], [TableOrder], [Active]) VALUES (N'DQ', N'https://api.syniti.eu/v3/', N'rules', N'tnt_4WTHRSqQUs1UG4DormwqfV36NaZv', CAST(N'2026-06-04T14:10:44.230' AS DateTime), N'rules', N'', N'tapi_d0717fa85bce4c82a7d371d583e410a5', N'', NULL, 3, 1)
GO
INSERT [dbo].[GETAPIRESULTS] ([ExtractID], [URL], [URLEXTENSION], [TENANTID], [LastUpdate], [TABLENAME], [GETRESULTS], [APIUsername], [APIPassword], [APIPassword_BAK], [TableOrder], [Active]) VALUES (N'TEST', N'https://api.syniti.eu/v3/', N'categories', N'tnt_4WTHRSqQUs1UG4DormwqfV36NaZv', CAST(N'2026-11-13T14:48:37.453' AS DateTime), N'categories', N'', N'tapi_d0717fa85bce4c82a7d371d583e410a5', N'', NULL, 3, 1)
GO
INSERT [dbo].[GETAPIRESULTS] ([ExtractID], [URL], [URLEXTENSION], [TENANTID], [LastUpdate], [TABLENAME], [GETRESULTS], [APIUsername], [APIPassword], [APIPassword_BAK], [TableOrder], [Active]) VALUES (N'TEST', N'https://api.syniti.eu/v3/', N'data-quality-jobs', N'tnt_4WTHRSqQUs1UG4DormwqfV36NaZv', CAST(N'2026-11-13T14:48:41.363' AS DateTime), N'dataqualityjobs', N'', N'tapi_d0717fa85bce4c82a7d371d583e410a5', N'', NULL, 3, 1)
GO
INSERT [dbo].[GETAPIRESULTS] ([ExtractID], [URL], [URLEXTENSION], [TENANTID], [LastUpdate], [TABLENAME], [GETRESULTS], [APIUsername], [APIPassword], [APIPassword_BAK], [TableOrder], [Active]) VALUES (N'TEST', N'https://api.syniti.eu/v3/', N'datastores', N'tnt_4WTHRSqQUs1UG4DormwqfV36NaZv', CAST(N'2026-11-13T14:48:41.543' AS DateTime), N'datastores', N'', N'tapi_d0717fa85bce4c82a7d371d583e410a5', N'', NULL, 3, 1)
GO
INSERT [dbo].[GETAPIRESULTS] ([ExtractID], [URL], [URLEXTENSION], [TENANTID], [LastUpdate], [TABLENAME], [GETRESULTS], [APIUsername], [APIPassword], [APIPassword_BAK], [TableOrder], [Active]) VALUES (N'TEST', N'https://api.syniti.eu/v3/', N'enforcements', N'tnt_4WTHRSqQUs1UG4DormwqfV36NaZv', CAST(N'2026-11-13T14:48:42.293' AS DateTime), N'enforcements', N'', N'tapi_d0717fa85bce4c82a7d371d583e410a5', N'', NULL, 3, 1)
GO
INSERT [dbo].[GETAPIRESULTS] ([ExtractID], [URL], [URLEXTENSION], [TENANTID], [LastUpdate], [TABLENAME], [GETRESULTS], [APIUsername], [APIPassword], [APIPassword_BAK], [TableOrder], [Active]) VALUES (N'TEST', N'https://api.syniti.eu/v3/', N'implementations', N'tnt_4WTHRSqQUs1UG4DormwqfV36NaZv', CAST(N'2026-11-13T14:48:44.113' AS DateTime), N'implementations', N'', N'tapi_d0717fa85bce4c82a7d371d583e410a5', N'', NULL, 3, 1)
GO
INSERT [dbo].[GETAPIRESULTS] ([ExtractID], [URL], [URLEXTENSION], [TENANTID], [LastUpdate], [TABLENAME], [GETRESULTS], [APIUsername], [APIPassword], [APIPassword_BAK], [TableOrder], [Active]) VALUES (N'TEST', N'https://api.syniti.eu/v3/', N'rules', N'tnt_4WTHRSqQUs1UG4DormwqfV36NaZv', CAST(N'2026-11-13T14:48:37.300' AS DateTime), N'rules', N'', N'tapi_d0717fa85bce4c82a7d371d583e410a5', N'', NULL, 3, 1)
GO
INSERT [dbo].[GETAPIRESULTS] ([ExtractID], [URL], [URLEXTENSION], [TENANTID], [LastUpdate], [TABLENAME], [GETRESULTS], [APIUsername], [APIPassword], [APIPassword_BAK], [TableOrder], [Active]) VALUES (N'TEST', N'https://api.syniti.eu/v3/', N'subject-areas', N'tnt_4WTHRSqQUs1UG4DormwqfV36NaZv', CAST(N'2026-11-13T14:48:44.287' AS DateTime), N'subjectareas', N'', N'tapi_d0717fa85bce4c82a7d371d583e410a5', N'', NULL, 3, 1)
GO
INSERT [dbo].[GETAPIRESULTS] ([ExtractID], [URL], [URLEXTENSION], [TENANTID], [LastUpdate], [TABLENAME], [GETRESULTS], [APIUsername], [APIPassword], [APIPassword_BAK], [TableOrder], [Active]) VALUES (N'TEST', N'https://api.syniti.eu/v3/', N'systems', N'tnt_4WTHRSqQUs1UG4DormwqfV36NaZv', CAST(N'2026-11-13T14:48:44.580' AS DateTime), N'systems', N'', N'tapi_d0717fa85bce4c82a7d371d583e410a5', N'', NULL, 3, 1)
GO
INSERT [dbo].[GETAPIRESULTS] ([ExtractID], [URL], [URLEXTENSION], [TENANTID], [LastUpdate], [TABLENAME], [GETRESULTS], [APIUsername], [APIPassword], [APIPassword_BAK], [TableOrder], [Active]) VALUES (N'TEST', N'https://api.syniti.eu/v3/', N'users', N'tnt_4WTHRSqQUs1UG4DormwqfV36NaZv', CAST(N'2026-11-13T14:48:44.753' AS DateTime), N'users', N'', N'tapi_d0717fa85bce4c82a7d371d583e410a5', N'', NULL, 3, 1)
GO
