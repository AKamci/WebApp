FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 8080

ENV ASPNETCORE_URLS=http://+:8080

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

COPY ["WebApp/WebApp.csproj", "WebApp/"]
RUN dotnet restore "WebApp/WebApp.csproj"

COPY . .
WORKDIR "/src/WebApp"
RUN dotnet build "WebApp.csproj" -c Release -o /app/build

FROM base AS final
WORKDIR /app
COPY --from=build /app/build .
ENTRYPOINT ["dotnet", "WebApp.dll"]
