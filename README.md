# .Net-Docker

🚀 docker image:
------------

docker image build <br/>
docker image history <br/>
docker image inspect <br/>
docker image ls <br/>
docker image prune <br/>
docker image pull <br/>
docker image push <br/>
docker image rm <br/>
docker image tag <br/>

🚀 docker container:
------------
docker container cp <br/>
docker container create <br/>
docker container exec <br/>
docker container inspect <br/>
docker container kill <br/>
docker container logs <br/>
docker container ls <br/>
docker container ls -a <br/>
docker container pause <br/>
docker container port <br/>

docker container prune <br/>
docker container rename <br/>
docker container restart <br/>
docker container rm <br/>
docker container run <br/>
docker container start <br/>
docker container stats <br/>
docker container stop <br/>
docker container top <br/>

🚀 docker volume:
------------
docker volume create <br/>
docker volume inspect <br/>
docker volume ls <br/>
docker volume prune <br/>
docker volume rm <br/>

🚀 docker network:
------------
docker network connect <br/>
docker network create <br/>
docker network disconect <br/>
docker network inspect <br/>
docker network ls <br/>
docker network prune <br/>
docker network rm <br/>

🚀 docker registry:
------------
docker registry events <br/>
docker registry history <br/>
docker registry info <br/>
docker registry inspect <br/>
docker registry joblogs <br/>
docker registry ls <br/>
docker registry rmi <br/>


🚀 Dockerfile:
------------

CMD <br/>
RUN <br/>
COPY <br/>
FROM <br/>
MAINTAINER <br/>
EXPOSE <br/>
ENV <br/>
ADD <br/>
ENTRYPOINT <br/>
WORKDIR <br/>


👨‍💻 .Net 3.0, ASP.NET - Web
------------


> [!IMPORTANT]
> docker pull mcr.microsoft.com/dotnet/core/sdk:3.0 <br />
> docker pull mcr.microsoft.com/dotnet/core/aspnet:3.0 <br />
> docker pull mcr.microsoft.com/dotnet/core/runtime:3.0 <br />


```
FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build-env
WORKDIR /src

COPY . .
WORKDIR /src/SaulWebNet3
RUN dotnet restore

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0
WORKDIR /app
COPY --from=build-env /src/SaulWebNet3/out ./
ENTRYPOINT ["dotnet", "SaulWebNet3.dll"]
```

```
docker image build -t saulwebnet3:1.0.0 -f "SaulWebNet3\Dockerfile" .
docker image build -t saulwebnet3:2.0.0 -f "SaulWebNet3\Dockerfile" .
docker image ls
```

```
docker container run -d -p 8080:80 IMAGE_ID
docker container run -d -p 8090:80 IMAGE_ID
```
http://localhost:8080/
http://localhost:8090/

👨‍💻 .Net 3.0, ASP.NET - Web API
------------
```
docker image build -t saulwebapinet3:1.0.0 -f "SaulWebApiNet3\Dockerfile" .
docker image ls
```

```
docker container run -d -p 8001:80 IMAGE_ID
```
http://localhost:8001/weatherforecast

👨‍💻 eShopOnWeb
------------
https://github.com/dotnet-architecture/eShopOnWeb/tree/netcore3.0
```
cd D:\.......\eShopOnWeb\src\Web
dotnet ef database update -c catalogcontext -p ../Infrastructure/Infrastructure.csproj -s Web.csproj
dotnet ef database update -c appIdentitydbcontext -p ../Infrastructure/Infrastructure.csproj -s Web.csproj
```

Dockerfile:
```
FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /app

COPY *.sln .
COPY . .
WORKDIR /app/src/Web
RUN dotnet restore

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS runtime
WORKDIR /app
COPY --from=build /app/src/Web/out ./

# Optional: Set this here if not setting it from docker-compose.yml
# ENV ASPNETCORE_ENVIRONMENT Development

ENTRYPOINT ["dotnet", "Web.dll"]
```

Creating container
```
cd D:\.......\eShopOnWeb

docker image ls
docker image build -t eshoponweb:1.0.0 -f .\src\Web\Dockerfile .
docker image ls // there is eshoponweb
docker container ls
docker container run -d --name eshoponweb -p 8060:80 IMAGE_ID
docker container ls // there is eshoponweb
http://localhost:8060/
```

Re-Creating if code changes
```
docker container ls
docker stop CONTAINER_ID
docker rm CONTAINER_ID
docker image build -t eshoponweb:2.0.0 -f .\src\Web\Dockerfile .
docker image ls
docker container run -d --name eshoponweb -p 8060:80 IMAGE_ID
http://localhost:8060/
```


Environment variables
```
cd D:\.......\eShopOnWeb\src\Web
docker image build -t eshoponweb:3.0.0 -f .\src\Web\Dockerfile .
docker image ls
docker container run -d --name eshoponweb -p 9090:80 IMAGE_ID
http://localhost:9090/ // Error

docker container ls
docker logs CONTAINER_ID
docker stop CONTAINER_ID
docker rm -f CONTAINER_ID
docker container prune // Remove all stopped containers
docker image ls
docker container run -d --name eshoponweb -p 9090:80 -e "ConnectionStrings:CatalogConnection=Server=192.168.0.44\SQLEXPRESS;User id=DESA;Password=123456;Initial Catalog=Microsoft.eShopOnWeb.CatalogDb" -e "ConnectionStrings:IdentityConnection=Server=192.168.0.44\SQLEXPRESS;User id=DESA;Password=123456;Initial Catalog=Microsoft.eShopOnWeb.Identity" IMAGE_ID
```

> [!IMPORTANT]
> `Instead of \\ use only \`


👨‍💻 Blazor 5.0
------------
- New Proyect Blazor Server App | .Net 5.0 | No HTTPS
- Web debug properties in "Green play button" Select "Web" to open console popup and run
- Create Dockerfile: Web, right clic > Add > Docker Support > Linux, OK
- "Green play button" Select "IIS Express" instead of "Docker"

Dockerfile:
```
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
# ADDED MANUALLY:
ENV ASPNETCORE_URLS=http://*:80

# This stage is used to build the service project
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["Web/Web.csproj", "Web/"]
RUN dotnet restore "./Web/Web.csproj"
COPY . .
WORKDIR "/src/Web"
RUN dotnet build "./Web.csproj" -c $BUILD_CONFIGURATION -o /app/build

# This stage is used to publish the service project to be copied to the final stage
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./Web.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# This stage is used in production or when running from VS in regular mode (Default when not using the Debug configuration)
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

# ADDED MANUALLY:
RUN ln -fs /usr/share/zoneinfo/America/Lima /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

ENTRYPOINT ["dotnet", "Web.dll"]
```

Commands
```
cd D:\.......\WebBlazor
docker build -t blazor5.0-app:1:0 -f .\Web\Dockerfile .
docker image ls

docker create --name blazor5.0-app -p 6001:80 blazor5.0-app:1.0
docker start blazor5.0-app
docker container ls
docker logs blazor5.0-app

http://localhost:6001/
```



👨‍💻 WebAPI 6.0
------------
- New Proyect > ASP.NET Core Web API | .Net 6.0 | Default: HTTPS, Use Controllers, Enable OpenAPI
- Program, Enable Swagger for Develop Mode
- Create Dockerfile: Web, right clic > Add > Docker Support > Linux, OK

> [!IMPORTANT]
> docker pull mcr.microsoft.com/dotnet/aspnet:6.0 <br />
> docker pull mcr.microsoft.com/dotnet/sdk:6.0 <br />


Dockerfile:
```
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 8080
# Added manually
ENV ASPNETCORE_URLS=http://*:8080
# EXPOSE 80
# EXPOSE 443


# This stage is used to build the service project
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["WebAPI/WebAPI.csproj", "WebAPI/"]
RUN dotnet restore "./WebAPI/WebAPI.csproj"
COPY . .
WORKDIR "/src/WebAPI"
RUN dotnet build "./WebAPI.csproj" -c $BUILD_CONFIGURATION -o /app/build

# This stage is used to publish the service project to be copied to the final stage
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./WebAPI.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# This stage is used in production or when running from VS in regular mode (Default when not using the Debug configuration)
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

# Added manually
RUN ln -fs /usr/share/zoneinfo/America/Lima /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

ENTRYPOINT ["dotnet", "WebAPI.dll"]
```

Commands
```
cd D:\.......\WebAPI
docker build -t webapi6.0-app:2.0 -f .\WebApi\Dockerfile .
docker image ls
docker create --name webapi6.0-app -p 8080:8080 webapi6.0-app:2.0

docker container ls
docker start webapi6.0-app
docker stop webapi6.0-app
docker restart webapi6.0-app
docker logs webapi6.0-app

http://localhost:8080/swagger/index.html
```


