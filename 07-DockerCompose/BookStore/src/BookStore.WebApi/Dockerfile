#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["src/BookStore.WebApi/BookStore.WebApi.csproj", "src/BookStore.WebApi/"]
COPY ["src/BookStore.Domain/BookStore.Domain.csproj", "src/BookStore.Domain/"]
COPY ["src/BookStore.Infrastructure/BookStore.Infrastructure.csproj", "src/BookStore.Infrastructure/"]
RUN dotnet restore "src/BookStore.WebApi/BookStore.WebApi.csproj"
COPY . .
WORKDIR "/src/src/BookStore.WebApi"
RUN dotnet build "BookStore.WebApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "BookStore.WebApi.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "BookStore.WebApi.dll"]