# 1. Aşama: Build Aşaması
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /app

# Projeyi kopyalayın
COPY WebApp.csproj ./

# Bağımlılıkları yükleyin
RUN dotnet restore WebApp.csproj

# Uygulama kodunu kopyalayın ve derleyin
COPY . ./
RUN dotnet publish WebApp.csproj -c Release -o out

# 2. Aşama: Çalıştırma Aşaması
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build-env /app/out ./

# Uygulamayı çalıştırın
ENTRYPOINT ["dotnet", "WebApp.dll"]
