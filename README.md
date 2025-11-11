# Clean Architecture Blazor Server (SFC/TOFC)
> A comprehensive Blazor Server application template built with Clean Architecture principles, featuring advanced code generation, AI-powered development support, and enterprise-grade functionality.

## 🎯 Overview

This project is a production-ready Blazor Server application template that demonstrates Clean Architecture implementation with .NET 9. It provides a solid foundation for building scalable, maintainable enterprise applications with modern development practices and AI-enhanced productivity features.

### Key Features

- **🏗️ Clean Architecture**: Strict layer separation with dependency inversion
- **🤖 AI-Powered Development**: Integrated Cursor/Copilot support with comprehensive rules
- **🎨 Modern UI**: Beautiful, responsive interface built with MudBlazor
- **⚡ Real-time Communication**: SignalR integration for live updates
- **🔐 Enterprise Security**: Multi-factor authentication, role-based access control
- **🌐 Multi-tenancy**: Built-in tenant isolation and management
- **📊 Advanced Data Grid**: Sorting, filtering, pagination, and export capabilities
- **🎨 Code Generation**: Visual Studio extension for rapid development
- **🐳 Docker Ready**: Complete containerization support
- **📱 Progressive Web App**: PWA capabilities for mobile experience

## 🛠️ Technology Stack

| Layer | Technologies |
|-------|-------------|
| **Frontend** | Blazor Server, MudBlazor, SignalR |
| **Backend** | .NET 9, ASP.NET Core, MediatR, FluentValidation |
| **Database** | Entity Framework Core, MSSQL/PostgreSQL/SQLite |
| **Authentication** | ASP.NET Core Identity, OAuth 2.0, JWT |
| **Caching** | FusionCache, Redis |
| **Background Jobs** | Hangfire |
| **Testing** | xUnit, FluentAssertions, Moq |
| **DevOps** | Docker, GitHub Actions |

## 🏗️ Architecture Overview

```
┌─────────────────┐     ┌─────────────────┐    ┌─────────────────┐
│   Server.UI     │     │  Application    │    │     Domain      │
│   (Blazor)      │───▶│   (Business)    │───▶│   (Entities)    │
└─────────────────┘     └─────────────────┘    └─────────────────┘
         │                        │                        
         │              ┌─────────────────┐               
         └─────────────▶│ Infrastructure  │               
                        │   (Data/IO)     │               
                        └─────────────────┘               
```

### Layer Responsibilities

- **Domain**: Core business entities and rules (no dependencies)
- **Application**: Business logic, interfaces, and DTOs
- **Infrastructure**: External concerns (database, email, file system)
- **Server.UI**: Blazor components and user interface

## 🤖 AI-Powered Development

This project is optimized for AI-assisted development with comprehensive support for modern AI coding tools.

### 🎯 Cursor AI Integration

The project includes extensive [Cursor Rules](.cursor/rules/) that provide:

- **Architecture Guidelines**: Enforce Clean Architecture principles
- **Coding Standards**: Consistent patterns and best practices
- **Component Templates**: Pre-configured Blazor component structures
- **Security Patterns**: Built-in security implementation guides

### 🚀 Development Workflow

Enhanced productivity through AI-powered development:

- **Intelligent Code Generation**: Context-aware suggestions following project patterns
- **Automatic Layer Compliance**: AI ensures proper dependency flow
- **Pattern Recognition**: Consistent implementation across features
- **Smart Refactoring**: Architecture-aware code improvements

### 💡 Getting Started with AI Development

1. **Install Cursor**: Download from [cursor.sh](https://cursor.sh/)
2. **Load the Project**: Open the repository in Cursor
3. **Enable Rules**: The AI will automatically use the configured rules
4. **Start Coding**: Use natural language to describe features

**Example AI Prompts**:
```
"Create a new Product entity with CRUD operations following Clean Architecture"
"Add user authentication to the Orders page"
"Implement caching for the CustomerService"
```

### 📋 Development Workflow

The project includes a comprehensive [Development Workflow](docs/) with:

- **Task Management**: Structured approach to feature development
- **Code Review Guidelines**: Quality assurance processes
- **Testing Strategies**: Unit and integration testing patterns
- **Deployment Procedures**: CI/CD pipeline configurations

## 🚀 Quick Start

### Prerequisites

- [.NET 9 SDK](https://dotnet.microsoft.com/download/dotnet/9.0)
- [Visual Studio 2022](https://visualstudio.microsoft.com/) or [Rider](https://www.jetbrains.com/rider/)
- [Docker Desktop](https://www.docker.com/) (optional)

### Installation

1. **Install the Template**
   ```bash
   dotnet new install CleanArchitecture.Blazor.Solution.Template
   ```

2. **Create New Project**
   ```bash
   dotnet new ca-blazorserver-sln -n YourProjectName
   cd YourProjectName
   ```

3. **Setup Database**
   ```bash
   dotnet ef database update --project src/Migrators/Migrators.MSSQL
   ```

4. **Run the Application**
   ```bash
   dotnet run --project src/Server.UI
   ```

5. **Access the Application**
   - Navigate to `https://localhost:7152`
   - Login with default credentials (see documentation)

### 🐳 Docker Deployment

**Quick Start with In-Memory Database**:
```bash
docker run -p 8443:443 -e UseInMemoryDatabase=true \
  blazordevlab/cleanarchitectureblazorserver:latest
```

**Production Setup**:
```bash
docker-compose up -d
```

See [Docker Setup Documentation](#docker-setup-for-blazor-server-application) for detailed configuration.

## 🗄️ Database Support

| Database | Provider Name | Status |
|----------|---------------|---------|
| SQL Server | `mssql` | ✅ Fully Supported |
| PostgreSQL | `postgresql` | ✅ Fully Supported |
| SQLite | `sqlite` | ✅ Fully Supported |

Configure in `appsettings.json`:
```json
{
  "DatabaseSettings": {
    "DBProvider": "mssql",
    "ConnectionString": "Server=localhost;Database=YourDb;Trusted_Connection=true;"
  }
}
```

## 🔐 Authentication Providers

Configure OAuth providers in `appsettings.json`:

- **Microsoft**: [Setup Guide](https://learn.microsoft.com/en-us/aspnet/core/security/authentication/social/microsoft-logins)
- **Google**: [Setup Guide](https://learn.microsoft.com/en-us/aspnet/core/security/authentication/social/google-logins)
- **Facebook**: [Setup Guide](https://learn.microsoft.com/en-us/aspnet/core/security/authentication/social/facebook-logins)
- **Twitter**: [Setup Guide](https://learn.microsoft.com/en-us/aspnet/core/security/authentication/social/twitter-logins)

## 🚀 Docker Setup for Blazor Server Application

### Pull the Docker Image

```bash
docker pull blazordevlab/cleanarchitectureblazorserver:latest
```

### Run the Docker Container

For Development (In-Memory Database):
```bash
docker run -p 8443:443 -e UseInMemoryDatabase=true -e ASPNETCORE_ENVIRONMENT=Development -e ASPNETCORE_HTTPS_PORTS=443 blazordevlab/cleanarchitectureblazorserver:latest
```

For Production (Persistent Database and SMTP Configuration):
```bash
docker run -d -p 8443:443 \
-e UseInMemoryDatabase=false \
-e ASPNETCORE_ENVIRONMENT=Development \
-e ASPNETCORE_HTTP_PORTS=80 \
-e ASPNETCORE_HTTPS_PORTS=443 \
-e DatabaseSettings__DBProvider=mssql \
-e DatabaseSettings__ConnectionString="Server=127.0.0.1;Database=BlazorDashboardDb;User Id=sa;Password=<YourPassword>;MultipleActiveResultSets=true;Encrypt=false;TrustServerCertificate=false" \
-e SmtpClientOptions__User=<YourSMTPUser> \
-e SmtpClientOptions__Port=25 \
-e SmtpClientOptions__Server=<YourSMTPServer> \
-e SmtpClientOptions__Password=<YourSMTPPassword> \
-e Authentication__Microsoft__ClientId=<YourMicrosoftClientId> \
-e Authentication__Microsoft__ClientSecret=<YourMicrosoftClientSecret> \
-e Authentication__Google__ClientId=<YourGoogleClientId> \
-e Authentication__Google__ClientSecret=<YourGoogleClientSecret> \
-e Authentication__Facebook__AppId=<YourFacebookAppId> \
-e Authentication__Facebook__AppSecret=<YourFacebookAppSecret> \
blazordevlab/cleanarchitectureblazorserver:latest
```

### Docker Compose Setup

For easier management, use a docker-compose.yml file:

```yaml
version: '3.8'
services:
  blazorserverapp:
    image: blazordevlab/cleanarchitectureblazorserver:latest
    environment:
      - UseInMemoryDatabase=false
      - ASPNETCORE_ENVIRONMENT=Development
      - ASPNETCORE_URLS=http://+:80;https://+:443
      - ASPNETCORE_HTTP_PORTS=80
      - ASPNETCORE_HTTPS_PORTS=443
      - DatabaseSettings__DBProvider=mssql
      - DatabaseSettings__ConnectionString=Server=127.0.0.1;Database=BlazorDashboardDb;User Id=sa;Password=***;MultipleActiveResultSets=true;Encrypt=false;TrustServerCertificate=false
      - SmtpClientOptions__User=<YourSMTPUser>
      - SmtpClientOptions__Port=25
      - SmtpClientOptions__Server=<YourSMTPServer>
      - SmtpClientOptions__Password=<YourSMTPPassword>
      - Authentication__Microsoft__ClientId=<YourMicrosoftClientId>
      - Authentication__Microsoft__ClientSecret=<YourMicrosoftClientSecret>
      - Authentication__Google__ClientId=<YourGoogleClientId>
      - Authentication__Google__ClientSecret=<YourGoogleClientSecret>
      - Authentication__Facebook__AppId=<YourFacebookAppId>
      - Authentication__Facebook__AppSecret=<YourFacebookAppSecret>
    ports:
      - "8443:443"
    volumes:
      - files_volume:/app/Files

  mssql:
    image: mcr.microsoft.com/mssql/server:2022-latest
    environment:
      - ACCEPT_EULA=Y
      - SA_PASSWORD=YourStrongPassword!
    ports:
      - "1433:1433"
    volumes:
      - mssql_data:/var/opt/mssql

volumes:
  files_volume:
  mssql_data:
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### Video Tutorials

[![Adding Contact Entity](doc/create.png)](https://www.youtube.com/watch?v=X1b4hFLs4vo)
**Tutorial: Adding a Contact Entity**

[![Removing Customer Object](doc/remove.png)](https://www.youtube.com/watch?v=i3p-3I95YqM)
**Tutorial: Removing a Customer Object**
