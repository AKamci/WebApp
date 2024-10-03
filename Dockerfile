# 1. Aşama: Build Aşaması
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /app

# Projeyi kopyalayın ve bağımlılıkları yükleyin
COPY *.csproj ./
RUN dotnet restore

# Uygulama kodunu kopyalayın ve derleyin
COPY . ./
RUN dotnet publish -c Release -o out

# 2. Aşama: Çalıştırma Aşaması
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build-env /app/out ./

# Uygulamayı çalıştırın
ENTRYPOINT ["dotnet", "WebApp.dll"]
