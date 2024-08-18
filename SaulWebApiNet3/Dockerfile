FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build-env
WORKDIR /src

COPY . .
WORKDIR /src/SaulWebApiNet3
RUN dotnet restore

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0
WORKDIR /app
COPY --from=build-env /src/SaulWebApiNet3/out ./
ENTRYPOINT ["dotnet", "SaulWebApiNet3.dll"]
