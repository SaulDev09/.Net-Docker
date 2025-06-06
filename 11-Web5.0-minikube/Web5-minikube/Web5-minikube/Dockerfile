# See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

# This stage is used when running from VS in fast mode (Default for Debug configuration)
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
# ADDED MANUALLY:
ENV ASPNETCORE_URLS=http://*:80


# This stage is used to build the service project
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["Web5-minikube/Web5-minikube.csproj", "Web5-minikube/"]
RUN dotnet restore "./Web5-minikube/Web5-minikube.csproj"
COPY . .
WORKDIR "/src/Web5-minikube"
RUN dotnet build "./Web5-minikube.csproj" -c $BUILD_CONFIGURATION -o /app/build

# This stage is used to publish the service project to be copied to the final stage
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./Web5-minikube.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# This stage is used in production or when running from VS in regular mode (Default when not using the Debug configuration)
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

# ADDED MANUALLY:
RUN ln -fs /usr/share/zoneinfo/America/Lima /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

ENTRYPOINT ["dotnet", "Web5-minikube.dll"]