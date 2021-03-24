# Apodini Template Repository

This repository includes an example Apodini web service that can be used as a starting point for an Apodini web service.  

## Build an Apodini Web Service

An Apodini web service is build using [Swift](https://docs.swift.org/swift-book/) and uses [Swift Packages](https://developer.apple.com/documentation/swift_packages). You can learn more about the Swift Package Manager at [swift.org](https://swift.org/package-manager/).

### macOS & Xcode

If you use macOS, you can use [Xcode](https://apps.apple.com/de/app/xcode/id497799835) to open the `Package.swift` file at the root of the repository using Xcode. You can learn more on how to use Swift Packages with Xcode on [developer.apple.com](https://developer.apple.com/documentation/xcode/creating_a_standalone_swift_package_with_xcode).

### Visual Studio Code on any operating system

If you are not using macOS or don't want to use Xcode, you can use [Visual Studio Code](https://code.visualstudio.com) using the [Remote Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) plugin. You must install the latest version of [Visual Studio Code](https://code.visualstudio.com), the latest version of the [Remote Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) plugin and [Docker](https://www.docker.com/products/docker-desktop).

1. Open the folder using Visual Studio Code
2. If you have installed the [Remote Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) plugin [Visual Studio Code](https://code.visualstudio.com) automatically asks you to reopen the folder to develop in a container at the bottom right of the Visual Studio Code window.
3. Press "Reopen in Container" and wait until the docker container is build
4. You can now build the code using the [build keyboard shortcut](https://code.visualstudio.com/docs/getstarted/keybindings#_tasks) and run and test the code within the docker container using the Run and Debug area.

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

The example web service exposes a single `Handler` named `Greeter`:  
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
The `@Parameter` is exposed as a parameter in the URL. E.g., you can send a request to `localhost:8080/v1?name=Paul` to get the following response:  
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
The Swagger UI is also automatically generated and accessible at `http://localhost:8080/openapi-ui`.

## Continous Integration

The repository contains GitHub Actions to automatically build and test the example web service on a wide variety of platforms and configurations.
