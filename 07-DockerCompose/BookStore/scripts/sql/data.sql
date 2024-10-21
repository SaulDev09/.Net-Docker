USE BookStore
GO

INSERT INTO Categories(Name)
VALUES ('Educational'),('Drama'),('Fantasy'),('Mistery'),('SciFi'),('Western'),('Contemporary'),('Dystopian')
GO

INSERT INTO Books(CategoryId, Name, Author, Description, Value, PublishDate)
VALUES (1,'Parallel Programming and Concurrency with C# 10 and .NET 6','Alvin Ashcraft','Leverage the latest parallel and concurrency features in .NET 6 when building your next application and explore the benefits and challenges of asynchrony, parallelism, and concurrency in .NET via practical examples.', '37.99', '2022-08-30')
GO

INSERT INTO Books(CategoryId, Name, Author, Description, Value, PublishDate)
VALUES (1,'Mapping Data Flows in Azure Data Factory','Mark Kromer','Build scalable ETL data pipelines in the cloud using Azure Data Factory Mapping Data Flows.', '49.99', '2022-08-26')
GO

INSERT INTO Books(CategoryId, Name, Author, Description, Value, PublishDate)
VALUES (2,'National Geographic Atlas of the National Parks','Jon Waterman','The first book of its kind, this stunning atlas showcases America park system from coast to coast, richly illustrated with an inspiring and informative collection of maps, graphics, and photographs.', '44.99', '2019-11-19')
GO
