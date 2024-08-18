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