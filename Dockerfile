# Use the .NET 8 SDK (build stage)
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the solution and project files
COPY Huxley2/*.csproj Huxley2/
COPY Huxley2Tests/*.csproj Huxley2Tests/
COPY . .

# Restore dependencies
RUN dotnet restore Huxley2/Huxley2.csproj

# Build the project
RUN dotnet publish Huxley2/Huxley2.csproj -c Release -o /app/publish

# Final stage: runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copy the published output
COPY --from=build /app/publish .

# Expose the port your app uses
EXPOSE 8081

# Run the .NET app
ENTRYPOINT ["dotnet", "Huxley2.dll"]
