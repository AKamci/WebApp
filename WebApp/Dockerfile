# Temel imaj olarak Windows tabanlı .NET SDK
FROM mcr.microsoft.com/dotnet/sdk:7.0-nanoserver-1809 AS build
WORKDIR /src

COPY ["WebApp/WebApp.csproj", "WebApp/"]
RUN dotnet restore "WebApp/WebApp.csproj"

COPY . .
WORKDIR "/src/WebApp"
RUN dotnet build "WebApp.csproj" -c Release -o /app/build

# Temel imaj olarak Windows tabanlı .NET runtime
FROM mcr.microsoft.com/dotnet/aspnet:7.0-nanoserver-1809 AS base
WORKDIR /app
COPY --from=build /app/build .
ENTRYPOINT ["dotnet", "WebApp.dll"]