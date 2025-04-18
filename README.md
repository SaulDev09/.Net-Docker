# .Net-Docker

## Índice

- [🚀 docker image](#-docker-image)
- [🚀 docker container](#-docker-container)
- [🚀 docker volume](#-docker-volume)
- [🚀 docker network](#-docker-network)
- [🚀 docker registry](#-docker-registry)
- [🚀 Dockerfile](#-dockerfile)
- [👨‍💻 01. .Net 3.0, ASP.NET - Web (feature/Net3)](#-01-net-30-aspnet---web-featurenet3)
- [👨‍💻 02. .Net 3.0, ASP.NET - Web API (feature/02-Net3-Api)](#-02-net-30-aspnet---web-api-feature02-net3-api)
- [👨‍💻 03. eShopOnWeb (feature/03-eShop)](#-03-eshoponweb-feature03-eshop)
- [👨‍💻 04. Blazor 5.0 (feature/04-Blazor5.0)](#-04-blazor-50-feature04-blazor50)
- [👨‍💻 05. WebAPI 6.0 (feature/05-API6.0)](#-05-webapi-60-feature05-api60)
- [👨‍💻 06. WeatherAPI 7.0 (feature/06-API7.0)](#-06-weatherapi-70-feature06-api70)
- [👨‍💻 07. BookStore 7.0 (feature/107-BookStore7.0)](#-07-bookstore-70-feature107-bookstore70)
- [👨‍💻 08. BookStore 8.0 (feature/108-BookStore8.0)](#-08-bookstore-80-feature108-bookstore80)
- [👨‍💻 09. BookStore 9.0 (feature/109-BookStore9.0)](#-09-bookstore-90-feature109-bookstore90)
- [👨‍💻 10. BookStore 9.0 - docker-compose (feature/110-BookStore9.0-dockercompose)](#-10-bookStore-90---docker-compose-feature110-BookStore90-dockercompose)
- [👨‍💻 11. BookStore 7.0 - docker-compose (feature/111-BookStore7.0-dockercompose)](#-11-bookstore-70---docker-compose-feature111-bookstore70-dockercompose)
- [👨‍💻 12. Install Minikube (feature/112-install-minikube)](#-12-install-minikube-feature112-install-minikube)
- [👨‍💻 13. .Net 5.0 (feature/113-Net5.0-minikube)](#-13-net-50-feature113-net50-minikube)
- [👨‍💻 14. BookStore 7.0 (feature/114-BookStore7.0-minikube)](#-14-bookstore-70-feature114-bookstore70-minikube)


## 🚀 docker image:

docker image build <br/>
docker image history <br/>
docker image inspect <br/>
docker image ls <br/>
docker image prune <br/>
docker image pull <br/>
docker image push <br/>
docker image rm <br/>
docker image tag <br/>

## 🚀 docker container:

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

## 🚀 docker volume:

docker volume create <br/>
docker volume inspect <br/>
docker volume ls <br/>
docker volume prune <br/>
docker volume rm <br/>

## 🚀 docker network:

docker network connect <br/>
docker network create <br/>
docker network disconect <br/>
docker network inspect <br/>
docker network ls <br/>
docker network prune <br/>
docker network rm <br/>

## 🚀 docker registry:

docker registry events <br/>
docker registry history <br/>
docker registry info <br/>
docker registry inspect <br/>
docker registry joblogs <br/>
docker registry ls <br/>
docker registry rmi <br/>


## 🚀 Dockerfile:


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


## 👨‍💻 01. .Net 3.0, ASP.NET - Web (feature/Net3)


> [!IMPORTANT]
> docker pull mcr.microsoft.com/dotnet/core/sdk:3.0 <br />
> docker pull mcr.microsoft.com/dotnet/core/aspnet:3.0 <br />
> docker pull mcr.microsoft.com/dotnet/core/runtime:3.0 <br />


```
FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build-env
WORKDIR /src

COPY . .
WORKDIR /src/01-WebNet3
RUN dotnet restore

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0
WORKDIR /app
COPY --from=build-env /src/01-WebNet3/out ./
ENTRYPOINT ["dotnet", "SaulWebNet3.dll"]
```

```
docker image build -t 01saulwebnet3:1.0.0 -f "01-WebNet3\Dockerfile" .
docker image build -t 01saulwebnet3:2.0.0 -f "01-WebNet3\Dockerfile" .
docker image build --no-cache -t 01saulwebnet3:6.0.0 -f "01-WebNet3\Dockerfile" .

docker image ls
```

```
docker container run -d -p 8080:80 IMAGE_ID
docker container run -d -p 8090:80 IMAGE_ID
docker container run -d -p 8080:80 NAME
docker container run -d -p 8080:80 01saulwebnet3:6.0.0
```
http://localhost:8080/
http://localhost:8090/

## 👨‍💻 02. .Net 3.0, ASP.NET - Web API (feature/02-Net3-Api)

> [!IMPORTANT]
> docker pull mcr.microsoft.com/dotnet/core/sdk:3.0 <br />
> docker pull mcr.microsoft.com/dotnet/core/aspnet:3.0 <br />
> docker pull mcr.microsoft.com/dotnet/core/runtime:3.0 <br />

```
FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build-env
WORKDIR /src

COPY . .
WORKDIR /src/02-WebApiNet3
RUN dotnet restore

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0
WORKDIR /app
COPY --from=build-env /src/02-WebApiNet3/out ./
ENTRYPOINT ["dotnet", "SaulWebApiNet3.dll"]
```

```
docker image build -t 02saulwebapinet3:1.0.0 -f "02-WebApiNet3\Dockerfile" .
docker image ls
```

```
docker container run -d -p 8001:80 IMAGE_ID
docker container run -d -p 8001:80 NAME
docker container run -d -p 8080:80 02saulwebapinet3:1.0.0
```
http://localhost:8001/weatherforecast


## 👨‍💻 03. eShopOnWeb (feature/03-eShop)

### From Scratch:
Project URL https://github.com/dotnet-architecture/eShopOnWeb/tree/netcore3.0

```
git clone https://github.com/dotnet-architecture/eShopOnWeb.git
git checkout netcore3.0
```

Go to libman.json

<table>
  <tr>
    <th colspan="2">Before</th>
    <th colspan="2">After</th>
  </tr>
  <tr>
    <td>provider</td>
    <td>library</td>
    <td>provider</td>
    <td>library</td>    
  </tr>
  <tr>
    <td></td>
    <td>jquery@3.3.1</td>
    <td></td>
    <td>jquery@3.7.1</td>
  </tr>
  <tr>
    <td>unpkg</td>
    <td>In bootstrap@3.3.7</td>
    <td>jsdelivr</td>
    <td></td>    
  </tr>
  <tr>
    <td></td>
    <td>jquery-validation-unobtrusive@3.2.10</td>
    <td></td>
    <td>jquery-validation-unobtrusive@4.0.0</td>
  </tr>
  <tr>
    <td></td>
    <td>jquery-validate@1.17.0</td>
    <td></td>
    <td>jquery-validate@1.21.0</td>
  </tr>
  <tr>
    <td>unpkg</td>
    <td>In @aspnet/signalr@1.0.3</td>
    <td>jsdelivr</td>
    <td></td>    
  </tr>  
</table>

> [!NOTE]
> To use a real database instead of in-memory database:

Go to `D:\...\03-eShopOnWeb-netcore3.0\src\Web\Startup.cs`
```
Comment ConfigureInMemoryDatabases(services);
Uncomment ConfigureProductionServices(services);
```

> [!CAUTION]
> To fix Cookies issue:

Go to ConfigureCookieSettings and update:

```
services.Configure<CookiePolicyOptions>(options =>
{
    options.MinimumSameSitePolicy = SameSiteMode.Lax;
    options.Secure = CookieSecurePolicy.Always;
    options.HttpOnly = AspNetCore.CookiePolicy.HttpOnlyPolicy.Always;
    options.CheckConsentNeeded = context => true;
});
```


Go to `D:\...\03-eShopOnWeb-netcore3.0\src\Web\appsettings.json`

Change ConnectionStrings values


Go to `D:\...\03-eShopOnWeb-netcore3.0\src\Web`

```
dotnet ef database update -c catalogcontext -p ../Infrastructure/Infrastructure.csproj -s Web.csproj
dotnet ef database update -c appIdentitydbcontext -p ../Infrastructure/Infrastructure.csproj -s Web.csproj
```

Existing Dockerfile:
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

ENTRYPOINT ["dotnet", "Web.dll"]
```

**Creating container**

Go to solution folder: cd `D:\...\03-eShopOnWeb-netcore3.0`

```
docker image ls
docker image build -t 03eshoponweb:25.0.0 -f .\src\Web\Dockerfile .
docker image ls // there is 03eshoponweb
docker container ls
docker container run -d --name 03eshoponweb -p 8060:80 IMAGE_ID
docker container run -d --name 03eshoponweb -p 8060:80 NAME
docker container run -d --name 03eshoponwebv25 -p 8061:80 03eshoponweb:25.0.0
docker container ls // there is 03eshoponweb
http://localhost:8060/
```

Re-Creating if code changes
```
docker container ls
docker stop CONTAINER_ID
docker rm CONTAINER_ID
docker image build -t 03eshoponweb:2.0.0 -f .\src\Web\Dockerfile .
docker image ls
docker container run -d --name 03eshoponweb -p 8060:80 IMAGE_ID
http://localhost:8060/
```


**Environment variables**
Go to solution folder: cd `D:\...\03-eShopOnWeb-netcore3.0`
```
docker image build -t 03eshoponweb:3.0.0 -f .\src\Web\Dockerfile .
docker image ls
docker container run -d --name 03eshoponweb -p 9090:80 IMAGE_ID
http://localhost:9090/ // Error

docker container ls
docker logs CONTAINER_ID
docker stop CONTAINER_ID
docker rm -f CONTAINER_ID
docker container prune // Remove all stopped containers
docker image ls
docker container run -d --name 03eshoponweb -p 9090:80 -e "ConnectionStrings:CatalogConnection=Server=192.168.0.44\SQLEXPRESS;User id=DESA;Password=123456;Initial Catalog=Microsoft.eShopOnWeb.CatalogDb" -e "ConnectionStrings:IdentityConnection=Server=192.168.0.44\SQLEXPRESS;User id=DESA;Password=123456;Initial Catalog=Microsoft.eShopOnWeb.Identity" IMAGE_ID
docker container run -d --name 03eshoponweb -p 9090:80 -e "Logging:LogLevel:Default=..." IMAGE_ID
```

> [!IMPORTANT]
> `In the ConnectionStrings: Instead of \\ use only \`


## 👨‍💻 04. Blazor 5.0 (feature/04-Blazor5.0)

- New Proyect:
Blazor Server App   
.Net 5.0   
No HTTPS   

- In "Green play button" Select "Web" (project name) to open console popup and run
- Create Dockerfile: Web, right clic > Add > Docker Support > Linux, OK
- "Green play button" Select "IIS Express" instead of "Docker"

> [!IMPORTANT]
> In Dockerfile:

```
# ADDED MANUALLY:
ENV ASPNETCORE_URLS=http://*:80

# ADDED MANUALLY:
RUN ln -fs /usr/share/zoneinfo/America/Lima /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
```

Like this:
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

Go to solution folder: `cd D:\...\04-Blazor5.0\WebBlazor`
```
docker build -t 04blazor5.0-app:1.0.0 -f .\Web\Dockerfile .
docker image ls

docker create --name 04blazor5.0-app -p 6001:80 04blazor5.0-app:1.0.0
docker start 04blazor5.0-app
docker container ls
docker logs 04blazor5.0-app
```
http://localhost:6001/


## 👨‍💻 05. WebAPI 6.0 (feature/05-API6.0)

> [!IMPORTANT]
> docker pull mcr.microsoft.com/dotnet/aspnet:6.0 <br />
> docker pull mcr.microsoft.com/dotnet/sdk:6.0 <br />

- New Proyect:
ASP.NET Core Web API   
.Net 6.0   
Default: HTTPS, Enable OpenAPI, Use Controllers

Go to `Program.cs` and Enable Swagger for Develop Mode

Comment

```
if (app.Environment.IsDevelopment()) {
  ...
}
```

Create Dockerfile: Web, right clic > Add > Docker Support... > Linux, OK

> [!IMPORTANT]
> In Dockerfile:

Change Ports

```
# Added manually
EXPOSE 8080
ENV ASPNETCORE_URLS=http://*:8080

# Comment
# EXPOSE 80
# EXPOSE 443
```

Set localtime, important for Numbers, Currency, Timezone
```
# ADDED MANUALLY:
RUN ln -fs /usr/share/zoneinfo/America/Lima /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
```

Like this:
```
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
# Added manually
EXPOSE 8080
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

Go to solution folder: `cd D:\...\05-API6.0\WebAPI`
```
docker build -t 05webapi6.0-app:1.0 -f .\WebApi\Dockerfile .
docker image ls
docker create --name 05webapi6.0-app -p 8080:8080 05webapi6.0-app:1.0

docker container ls
docker start 05webapi6.0-app
docker stop 05webapi6.0-app
docker restart 05webapi6.0-app
docker logs 05webapi6.0-app
```
http://localhost:8080/swagger/index.html


## 👨‍💻 06. WeatherAPI 7.0 (feature/06-API7.0)

> [!IMPORTANT]
> V1 <br />
> docker pull mcr.microsoft.com/dotnet/aspnet:7.0 <br />
> docker pull mcr.microsoft.com/dotnet/sdk:7.0 <br />
> <br />
> V2 <br />
> docker pull mcr.microsoft.com/dotnet/aspnet:7.0-alpine <br />
> docker pull mcr.microsoft.com/dotnet/sdk:7.0-alpine <br />


- New Proyect:
ASP.NET Core Web API   
.Net 7.0   
Default: HTTPS, Enable OpenAPI, Use Controllers

- "Green play button" Select "http"
- Create Dockerfile: Web, right clic > Add > Docker Support > Linux, OK

> [!IMPORTANT]
> In Dockerfile:

Change Ports

```
# Added manually
ENV ASPNETCORE_URLS=http://*:80

# Comment
# EXPOSE 443
```

Like this v1:
```
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
# Added manually
ENV ASPNETCORE_URLS=http://*:80
# Comment
#EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["WeatherAPI/WeatherAPI.csproj", "WeatherAPI/"]
RUN dotnet restore "./WeatherAPI/WeatherAPI.csproj"
COPY . .
WORKDIR "/src/WeatherAPI"
RUN dotnet build "./WeatherAPI.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./WeatherAPI.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WeatherAPI.dll"]
```

Go to solution folder: `cd D:\...\06-API7.0\WeatherAPI`
```
docker image build -t 06webapi7.0-app:1.0 -f .\WeatherAPI\Dockerfile .
docker image ls
// Vulnerabilities
docker scan 06webapi7.0-app:1.0 // Scan command has been removed, open Docker Desktop > Images > Clic name 
docker scout cves IMAGE_ID
docker scout cves NAME
```

> [!IMPORTANT]
> To fix the Vulnerabilities use alpine version:

```
# V1
# FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
# V2
FROM mcr.microsoft.com/dotnet/aspnet:7.0-alpine AS base

...

# V1
# FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
# V2
FROM mcr.microsoft.com/dotnet/sdk:7.0-alpine AS build
```



Dockerfile v2:
```
# V2
FROM mcr.microsoft.com/dotnet/aspnet:7.0-alpine AS base
WORKDIR /app
EXPOSE 80
# Added manually
# EXPOSE 443
ENV ASPNETCORE_URLS=http://+:80

# v2
FROM mcr.microsoft.com/dotnet/sdk:7.0-alpine AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["WeatherAPI/WeatherAPI.csproj", "WeatherAPI/"]
RUN dotnet restore "./WeatherAPI/WeatherAPI.csproj"
COPY . .
WORKDIR "/src/WeatherAPI"
RUN dotnet build "./WeatherAPI.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./WeatherAPI.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WeatherAPI.dll"]
```

Go to solution folder: `cd D:\...\06-API7.0\WeatherAPI`
```
docker image build -t 06webapi7.0-app:2.0 -f .\WeatherAPI\Dockerfile .
docker image ls
// Vulnerabilities
docker scan 06webapi7.0-app:2.0 // Scan command has been removed, open Docker Desktop > Images > Clic name 
docker scout cves IMAGE_ID
docker scout cves NAME
```

**Creating Containers: dev and prod**

Go to solution folder: `cd D:\...\06-API7.0\WeatherAPI`
```
docker container create --name 06webapi7.0-dev -p 8080:80 -e ASPNETCORE_ENVIRONMENT=Development 06webapi7.0-app:2.0
docker container create --name 06webapi7.0-prod -p 8081:80 -e ASPNETCORE_ENVIRONMENT=Production 06webapi7.0-app:2.0
docker start 06webapi7.0-dev
docker start 06webapi7.0-prod

http://localhost:8080/swagger/index.html
X http://localhost:8081/swagger/index.html // Swagger only for Development
http://localhost:8081/WeatherForecast
```


## 👨‍💻 07. BookStore 7.0 (feature/107-BookStore7.0)

> [!IMPORTANT]
> docker pull mcr.microsoft.com/dotnet/aspnet:7.0 <br />
> docker pull mcr.microsoft.com/dotnet/sdk:7.0 <br />

- Open BookStore project
- Create Dockerfile: Web, right clic > Add > Docker Support > Linux, OK

Dockerfile:
```
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["src/BookStore.WebApi/BookStore.WebApi.csproj", "src/BookStore.WebApi/"]
COPY ["src/BookStore.Domain/BookStore.Domain.csproj", "src/BookStore.Domain/"]
COPY ["src/BookStore.Infrastructure/BookStore.Infrastructure.csproj", "src/BookStore.Infrastructure/"]
RUN dotnet restore "./src/BookStore.WebApi/BookStore.WebApi.csproj"
COPY . .
WORKDIR "/src/src/BookStore.WebApi"
RUN dotnet build "./BookStore.WebApi.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./BookStore.WebApi.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "BookStore.WebApi.dll"]
```

Go to solution folder: `cd D:\...\07-BookStore`

Create docker-compose.yml:
```
version: '3.8'

networks:
  backend:
    name: bookstore-network

services:
  mssql:
    build: 
      context: ./scripts/sql
    container_name: bookstore-db
    ports:
      - "1433:1433"  
    environment:
      SA_PASSWORD: "P@ssw0rd?"
      ACCEPT_EULA: "Y"
      MSSQL_PID: "Express"
    networks:
      - backend

  api:
    build:
      context: ./
      dockerfile: ./src/BookStore.WebApi/Dockerfile
    container_name: bookstore-webapi
    depends_on:
      - mssql
    ports:
      - 5001:80
    environment:
      ConnectionStrings__DbConnection: Server=mssql;Database=BookStore;User Id=SA;Password=P@ssw0rd?;Encrypt=False
      ASPNETCORE_ENVIRONMENT: "Development"
    networks:
      - backend
```

In the solution folder: `cd D:\...\07-BookStore`

```
docker compose up -d --build
```

http://localhost:5001/swagger/index.html

```
docker-compose down
docker-compose up --build
```

## 👨‍💻 08. BookStore 8.0 (feature/108-BookStore8.0)

> [!IMPORTANT]
> docker pull mcr.microsoft.com/dotnet/aspnet:8.0 <br />
> docker pull mcr.microsoft.com/dotnet/sdk:8.0 <br />

- Open BookStore project
- Create Dockerfile: Web, right clic > Add > Docker Support > Linux, OK

Dockerfile:
```
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["src/BookStore.WebApi/BookStore.WebApi.csproj", "src/BookStore.WebApi/"]
COPY ["src/BookStore.Domain/BookStore.Domain.csproj", "src/BookStore.Domain/"]
COPY ["src/BookStore.Infrastructure/BookStore.Infrastructure.csproj", "src/BookStore.Infrastructure/"]
RUN dotnet restore "./src/BookStore.WebApi/./BookStore.WebApi.csproj"
COPY . .
WORKDIR "/src/src/BookStore.WebApi"
RUN dotnet build "./BookStore.WebApi.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./BookStore.WebApi.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "BookStore.WebApi.dll"]
```

> [!IMPORTANT]
> Run the Database image in the previous step or use the local database engine

Go to solution folder: `cd D:\...\08-BookStore`

```
docker build -t book-store:net8 -f .\src\BookStore.WebApi\Dockerfile .
docker image ls
docker container create --name book-store -p 8082:8080 -e ASPNETCORE_ENVIRONMENT=Development book-store:net8
docker container start book-store
docker start book-store
docker container ls or docker ps
docker inspect book-store
```

http://localhost:8082/swagger/index.html

**Adding Environment variables**

Changing Port, 80 instead of 8080
```
8082:80
-e ASPNETCORE_HTTP_PORTS=80

```

Changing Connection String
```
-e ConnectionStrings__DbConnection="Server=192.168.0.44\SQLEXPRESS;Database=BookStore;User id=DESA;Password=123456;TrustServerCertificate=True;" 
```

```
docker container rm -f book-store
docker container create --name book-store -p 8082:80 -e ASPNETCORE_ENVIRONMENT=Development -e ASPNETCORE_HTTP_PORTS=80 -e ConnectionStrings__DbConnection="Server=192.168.0.44\SQLEXPRESS;Database=BookStore;User id=DESA;Password=123456;TrustServerCertificate=True;" book-store:net8
// Double "_": ConnectionStrings "_ _" DbConnection
docker start book-store
docker logs book-store
```

http://localhost:8082/swagger/index.html

> [!IMPORTANT]
> `ConnectionStrings Instead of \\ use only \`


## 👨‍💻 09. BookStore 9.0 (feature/109-BookStore9.0)

> [!IMPORTANT]
> docker pull mcr.microsoft.com/dotnet/aspnet:9.0 <br />
> docker pull mcr.microsoft.com/dotnet/sdk:9.0 <br />

- Open BookStore project
- Create Dockerfile: Web, right clic > Add > Docker Support > Linux, OK

Dockerfile:
```
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["src/BookStore.WebApi/BookStore.WebApi.csproj", "src/BookStore.WebApi/"]
COPY ["src/BookStore.Domain/BookStore.Domain.csproj", "src/BookStore.Domain/"]
COPY ["src/BookStore.Infrastructure/BookStore.Infrastructure.csproj", "src/BookStore.Infrastructure/"]
RUN dotnet restore "./src/BookStore.WebApi/BookStore.WebApi.csproj"
COPY . .
WORKDIR "/src/src/BookStore.WebApi"
RUN dotnet build "./BookStore.WebApi.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./BookStore.WebApi.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "BookStore.WebApi.dll"]
```

> [!IMPORTANT]
> Run the Database image in the previous step or use the local database engine

Go to solution folder: `cd D:\...\09-DockerCompose9.0`

```
docker build -t 09book-store:net9 -f .\src\BookStore.WebApi\Dockerfile .
docker image ls
docker container create --name 09book-store -p 8082:8080 -e ASPNETCORE_ENVIRONMENT=Development 09book-store:net9
docker container start 09book-store
docker start 09book-store
docker container ls or docker ps
docker inspect 09book-store
```

http://localhost:8082/swagger/index.html

**Adding Environment variables**

Changing Port, 80 instead of 8080
```
8082:80
-e ASPNETCORE_HTTP_PORTS=80

```

Changing Connection String
```
-e ConnectionStrings__DbConnection="Server=192.168.0.44\SQLEXPRESS;Database=BookStore;User id=DESA;Password=123456;TrustServerCertificate=True;" 
```

```
docker container rm -f 09book-store
docker container create --name 09book-store -p 8082:80 -e ASPNETCORE_ENVIRONMENT=Development -e ASPNETCORE_HTTP_PORTS=80 -e ConnectionStrings__DbConnection="Server=192.168.0.44\SQLEXPRESS;Database=BookStore;User id=DESA;Password=123456;TrustServerCertificate=True;" 09book-store:net9
docker start 09book-store
docker logs 09book-store
```

http://localhost:8082/swagger/index.html

> [!IMPORTANT]
> `ConnectionStrings Instead of \\ use only \` <br />
> `ConnectionStrings Double "_": ConnectionStrings "_ _" DbConnection` <br />


## 👨‍💻 10. BookStore 9.0 - docker-compose (feature/110-BookStore9.0-dockercompose)

> [!IMPORTANT]
> Continue with the previous image

Go to solution folder: `cd D:\...\09-BookStore9.0-DockerCompose`

Create docker-compose.yml:
```
version: '3.9'

services:
  web-api:
    image: 09book-store:net9
    container_name: 09book-store-compose

    environment:
      ASPNETCORE_ENVIRONMENT: "Development"
      ASPNETCORE_HTTP_PORTS: "80"
      ConnectionStrings_DbConnection: "Server=192.168.0.44\\SQLEXPRESS;Database=BookStore;User id=DESA;Password=123456;TrustServerCertificate=True;"

    ports:
    - 8082:80
```

In the solution folder: `cd D:\...\09-BookStore9.0-DockerCompose`

```
docker compose up -d --build
```

http://localhost:8082/swagger/index.html

```
docker-compose down
docker-compose up --build
```

> [!IMPORTANT]
> Plan B: If there is no previous image, create it with the following line:

```
build:
 context: .
 dockerfile: src\BookStore.WebApi/Dockerfile
```

Create docker-compose.yml:
```
version: '3.9'

services:
  web-api:
    image: 09book-store:net9
    build:
     context: .
     dockerfile: src\BookStore.WebApi\Dockerfile
    container_name: 09book-store-compose

    environment:
      ASPNETCORE_ENVIRONMENT: "Development"
      ASPNETCORE_HTTP_PORTS: "80"
      ConnectionStrings_DbConnection: "Server=192.168.0.44\\SQLEXPRESS;Database=BookStore;User id=DESA;Password=123456;TrustServerCertificate=True;"

    ports:
    - 8082:80
```

```
docker-compose down
docker-compose up --build
```

http://localhost:8082/swagger/index.html



## 👨‍💻 11. BookStore 7.0 - docker-compose (feature/111-BookStore7.0-dockercompose)

Go to solution folder: `cd D:\...\10-BookStore7.0-DockerCompose`

Add docker-compose.yml
```
version: '3.8'

networks:
  backend:
    name: 11bookstore-network

services:
  mssql:
    build: 
      context: ./scripts/sql
    container_name: 11bookstore-db
    ports:
      - "1450:1433"
    environment:
      SA_PASSWORD: "P@ssw0rd?"
      ACCEPT_EULA: "Y"
      MSSQL_PID: "Express"
      MSSQL_CLIENT_ENCRYPTION: "Optional" #      
    networks:
      - backend

  api:
    build:
      context: ./
      dockerfile: ./src/BookStore.WebApi/Dockerfile
    container_name: 11bookstore-webapi
    depends_on:
      - mssql
    ports:
      - 5001:80
    environment:
      ConnectionStrings__DbConnection: Server=mssql;Database=BookStore;User Id=SA;Password=P@ssw0rd?;Encrypt=False;trustServerCertificate=true;
      ASPNETCORE_ENVIRONMENT: "Development"
    networks:
      - backend
```

```
docker compose up -d --build
```
http://localhost:5001/swagger/index.html

```
docker-compose down
docker-compose up --build
```

> [!IMPORTANT]
> To Deploy only Database

Go to: `cd D:\...\10-BookStore7.0-DockerCompose\scripts\sql`

```
docker image build -t 11database-test:8.0.0 -f Dockerfile .
docker container run --name 11database-test -p 1450:1433 -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=P@ssw0rd?" -e "MSSQL_PID=Express" -e "MSSQL_CLIENT_ENCRYPTION=Optional" 11database-test:8.0.0
```


## 👨‍💻 12. Install Minikube (feature/112-install-minikube)
Docker desktop: Settings > General > Check "Use the WSL 2 based engine"

```
kubectl version --client
```

Search: install minikube on windows 11   
Installation:   
OS: Windows   
Architecture: x86-64   
Release type: Stable   
Installer type: .exe download   
> latest release   

Or    
Poweshell: `winget install Kubernetes.minikube`    

Double Check Minikube in System environment    
System Properties > Environment variables > Path (in System variables) > Modify >    

```
minikube start
kubectl config get-clusters
kubectl cluster-info
kubectl get nodes
kubectl get namespaces # 4
kubectl config set-context --current --namespace=kube-system
kubectl get deployments
kubectl get pods # 7
kubectl get services # 1
kubectl logs etcd-minikube
kubectl config get-contexts # 1
kubectl config current-context # 1, minikube
minikube dashboard
minikube stop
minikube pause
minikube unpause
minikube delete --all # delete image, containers, settings
minikube delete --purge # delete all created files of minikube during installation
```


## 👨‍💻 13. .Net 5.0 (feature/113-Net5.0-minikube)

- New Proyect:
ASP.NET Core Web App (Model-View-Controller)   
.Net 5.0   
No HTTPS   

Go to `Program.cs` and Enable Logs in CreateHostBuilder


```
.ConfigureLogging(logging => 
{
  logging.ClearProviders();
  logging.AddConsole();
})


```

- In "Green play button" Select "Web" (project name) to open console popup and run
- Create Dockerfile: Web, right clic > Add > Docker Support > Linux, OK
- "Green play button" Select "IIS Express" instead of "Docker"

> [!IMPORTANT]
> In Dockerfile:

```
# ADDED MANUALLY:
ENV ASPNETCORE_URLS=http://*:80

# ADDED MANUALLY:
RUN ln -fs /usr/share/zoneinfo/America/Lima /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
```

Like this:
```
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
# ADDED MANUALLY:
ENV ASPNETCORE_URLS=http://*:80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["Web5-minikube/Web5-minikube.csproj", "Web5-minikube/"]
RUN dotnet restore "./Web5-minikube/Web5-minikube.csproj"
COPY . .
WORKDIR "/src/Web5-minikube"
RUN dotnet build "./Web5-minikube.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./Web5-minikube.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

# ADDED MANUALLY:
RUN ln -fs /usr/share/zoneinfo/America/Lima /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

ENTRYPOINT ["dotnet", "Web5-minikube.dll"]
```

Open VS Code > Open Project Folder > Install Extensions > YAML (for Red Hat)   

Create file: deployment.yml   

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web5-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web5
  template:
    metadata:
      labels:
        app: web5
    spec:
      containers:
      - name: web5-container
        image: 13web5.0-minikube:1.0.0
        resources:
          limits:
            memory: "128Mi"
            cpu: "500m"
        ports:
        - containerPort: 80
```


Create file: service.yml

```
apiVersion: v1
kind: Service
metadata:
  name: web5-service
spec:
  selector:
    app: web5
  ports:
    - port: 6001
      targetPort: 80
  type: LoadBalancer
```

**Creating Image in minikube**

Go to solution folder: `cd D:\...\11-Web5.0-minikube\Web5-minikube`

> [!CAUTION]
> Using Git Bash the Path should use "/", instead of "\"


```
minikube start
kubectl get nodes # 1
eval $(minikube docker-env) # minikube as context
docker info | grep Name # You should see "Name: minikube"
docker image ls
docker build -t 13web5.0-minikube:1.0.0 -f ./Web5-minikube/Dockerfile .
docker image ls # you should see 13web5.0-minikube:1.0.0
```

**Creating Container in minikube**

Go to solution folder: `cd D:\...\11-Web5.0-minikube\Web5-minikube`
```
minikube start
eval $(minikube docker-env) # minikube as context
docker info | grep Name # You should see "Name: minikube"
docker image ls # you should see 13web5.0-minikube:1.0.0
kubectl get namespaces
kubectl create namespace 13web5-0-minikube # don't use dots (13web5.0-minikube)
kubectl get namespaces # you should see 13web5-0-minikube
kubectl config set-context --current --namespace=13web5-0-minikube # Context minikube modified
kubectl apply -f Web5-minikube/deployment.yml # deployment created
kubectl get deployments # 1
kubectl get pods # 3 podS
kubectl logs <POD_NAME>
```

**Creating host access**
```
kubectl apply -f Web5-minikube/service.yml
kubectl get services # 1 with EXTERNAL-IP (tunnel) as Pending
minikube tunnel # start tunnel
```

Open a new Git Bash
```
kubectl get services # 1 with EXTERNAL-IP assigned
```

**Changing port**

Stop service: Ctrl + C

```
kubectl delete service <SERVICE-NAME>
kubectl delete service web5-service
```

Go to `service.yml` > Edit `- port: 7001`

```
kubectl apply -f Web5-minikube/service.yml
kubectl get services
minikube tunnel # start tunnel
```

Open a new Git Bash
```
kubectl get services # 1 with EXTERNAL-IP assigned
```

http://localhost:7001/

```
minikube dashboard
```

A web page will open

Select Namespace: 13web5-0-minikube


## 👨‍💻 14. BookStore 7.0 (feature/114-BookStore7.0-minikube)


- Open BookStore project   

- Go to `D:\...\12-BookStore7.0-minikube\src\BookStore.WebApi\appsettings.json`   

- Change ConnectionStrings values   

- Create Dockerfile: Web, right clic > Add > Docker Support > Linux, OK

Dockerfile:
```
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["src/BookStore.WebApi/BookStore.WebApi.csproj", "src/BookStore.WebApi/"]
COPY ["src/BookStore.Domain/BookStore.Domain.csproj", "src/BookStore.Domain/"]
COPY ["src/BookStore.Infrastructure/BookStore.Infrastructure.csproj", "src/BookStore.Infrastructure/"]
RUN dotnet restore "./src/BookStore.WebApi/BookStore.WebApi.csproj"
COPY . .
WORKDIR "/src/src/BookStore.WebApi"
RUN dotnet build "./BookStore.WebApi.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./BookStore.WebApi.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "BookStore.WebApi.dll"]
```

Go to solution folder: `cd D:\...\12-BookStore7.0-minikube`

```
minikube start
kubectl get pods -A
eval $(minikube docker-env) # pushin images minikube | minikube as context, In Linux
& minikube -p minikube docker-env --shell powershell | Invoke-Expression # pushin images minikube In Windows
docker image ls
docker image build -t 14bookstore7.0-minikube:1.0.0 -f src\BookStore.WebApi\Dockerfile .
docker image ls
```

**Create PODs**

Create file: deployment.yml in the Solution Folder

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: 14bookstore7-deployment
spec:
  selector:
    matchLabels:
      app: 14bookstore7
  template:
    metadata:
      labels:
        app: 14bookstore7
    spec:
      containers:
      - name: 14bookstore7-container
        image: 14bookstore7.0-minikube:1.0.0
        resources:
          limits:
            memory: "128Mi"
            cpu: "500m"
        ports:
        - containerPort: 80
```

```
minikube start
kubectl get pods -A
eval $(minikube docker-env) # pushin images minikube | minikube as context, In Linux
& minikube -p minikube docker-env --shell powershell | Invoke-Expression # pushin images minikube In Windows
docker image ls
kubectl get namespaces
kubectl create namespace 14bookstore7-0-minikube
kubectl get namespaces
kubectl apply -f deployment.yml -n 14bookstore7-0-minikube
kubectl get all -n 14bookstore7-0-minikube
kubectl get pods -n 14bookstore7-0-minikube
kubectl get deployments -n 14bookstore7-0-minikube
kubectl scale deployment/14bookstore7-deployment --replicas=5 -n 14bookstore7-0-minikube
kubectl get pods -n 14bookstore7-0-minikube
kubectl scale deploy 14bookstore7-deployment --replicas=2 -n 14bookstore7-0-minikube
kubectl get pods -n 14bookstore7-0-minikube
minikube dashboard
```

**Create Service**

Create file: service.yml in the Solution Folder   

```
apiVersion: v1
kind: Service
metadata:
  name: bookstore7-service14
spec:
  selector:
    app: 14bookstore7
  ports:
    - port: 3030
      targetPort: 80
  type: LoadBalancer
```

```
kubectl apply -f .\service.yml -n 14bookstore7-0-minikube
kubectl get all -n 14bookstore7-0-minikube # with EXTERNAL-IP (tunnel) as Pending
minikube tunnel # start tunnel
kubectl get all -n 14bookstore7-0-minikube # with EXTERNAL-IP (tunnel) Assigned
minikube dashboard
```

http://localhost:3030/api/books   
http://localhost:3030/api/categories   


