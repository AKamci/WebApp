FROM mcr.microsoft.com/dotnet/aspnet:7.0-nanoserver-1809 AS base
WORKDIR /app
EXPOSE 5230

ENV ASPNETCORE_URLS=http://+:5230

FROM mcr.microsoft.com/dotnet/sdk:7.0-nanoserver-1809 AS build
ARG configuration=Release
WORKDIR /src
COPY ["WebApp/WebApp.csproj", "WebApp/"]
RUN dotnet restore "WebApp\WebApp.csproj"
COPY . .
WORKDIR "/src/WebApp"
RUN dotnet build "WebApp.csproj" -c $configuration -o /app/build

FROM build AS publish
ARG configuration=Release
RUN dotnet publish "WebApp.csproj" -c $configuration -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebApp.dll"]
