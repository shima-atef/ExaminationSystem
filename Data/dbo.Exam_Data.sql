SET IDENTITY_INSERT [dbo].[Exam] ON
INSERT INTO [dbo].[Exam] ([Exam_ID], [Student_ID], [Grade], [Course_ID], [Duration], [NumsOfMCQ], [NumsOfTF], [Date], [Time]) VALUES (2, 2, 90, 3, 1, 4, 3, '2000-12-12', '02:00:00')
INSERT INTO [dbo].[Exam] ([Exam_ID], [Student_ID], [Grade], [Course_ID], [Duration], [NumsOfMCQ], [NumsOfTF], [Date], [Time]) VALUES (3, 2, NULL, 3, 1, 4, 3, '2000-12-12', '02:00:00')
INSERT INTO [dbo].[Exam] ([Exam_ID], [Student_ID], [Grade], [Course_ID], [Duration], [NumsOfMCQ], [NumsOfTF], [Date], [Time]) VALUES (4, 2, NULL, 3, 1, 4, 3, '2000-12-12', '02:00:00')
INSERT INTO [dbo].[Exam] ([Exam_ID], [Student_ID], [Grade], [Course_ID], [Duration], [NumsOfMCQ], [NumsOfTF], [Date], [Time]) VALUES (5, 2, NULL, 2, 1, NULL, NULL, NULL, NULL)
INSERT INTO [dbo].[Exam] ([Exam_ID], [Student_ID], [Grade], [Course_ID], [Duration], [NumsOfMCQ], [NumsOfTF], [Date], [Time]) VALUES (6, 2, 85, 1, 120, 5, 5, '2024-01-27', '12:00:00')
SET IDENTITY_INSERT [dbo].[Exam] OFF
