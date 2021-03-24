# Apodini Template Repository

This repository includes an example Apodini web service that can be used as a starting point for an Apodini web service.  

## Structure

The web service exposes a RESTful web API and an OpenAPI description:  
```swift
struct ExampleWebService: WebService {
    var configuration: Configuration {
        ExporterConfiguration()
            .exporter(RESTInterfaceExporter.self)
            .exporter(OpenAPIInterfaceExporter.self)
    }

    var content: some Component {
        Greeter()
    }
}
```

The example web serice exposes a single `Handler` named `Greeter`:  
```swift
struct Greeter: Handler {
    @Parameter var name: String = "World"
    
    
    func handle() -> String {
        "Hello, \(name)! 👋"
    }
}
```

## RESTful API

You can access the `Greeter` `Handler` at `http://localhost:8080/v1`.  
The `@Parameter` is exposed as a parameter in the URL. E.g. you can send a request to `localhost:8080/v1?name=Paul` to get the following response:  
```json
{
  "data" : "Hello, Paul! 👋",
  "_links" : {
    "self" : "http://127.0.0.1:8080/v1"
  }
}
```

## OpenAPI

You can access the OpenAPI document at `http://localhost:8080/openapi`.  
The Swagger UI is also automatically generated and accessible at  `http://localhost:8080/openapi-ui`.

## Continous Integration

The repository contains GitHub Actions to automatically build and test the example web service on a wide variaty of plattforms and configurations.
