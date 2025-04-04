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
