<!--

This source file is part of the Apodini Template open source project

SPDX-FileCopyrightText: 2021 Paul Schmiedmayer and the project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>

SPDX-License-Identifier: MIT

-->

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

### CLion on macOS and Windows

You can use [CLion with the Swift plugin](https://www.jetbrains.com/help/clion/swift.html) which also works on Windows and [allows you to use the Swift plugin in CLion on Windows ](https://blog.jetbrains.com/objc/2021/03/swift-on-windows-in-clion/)

## Structure

The web service exposes a RESTful web API and an OpenAPI description:  
```swift
@main
import Apodini
import ApodiniOpenAPI
import ApodiniREST
import ArgumentParser


@main
struct ExampleWebService: WebService {
  @Option(help: "The port the web service is offered at")
  var port: Int = 80
   
   
  var configuration: Configuration {
    HTTPConfiguration(port: port)
    REST {
      OpenAPI()
    }
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

### RESTful API

You can access the `Greeter` `Handler` at `http://localhost/v1`.  
The `@Parameter` is exposed as a parameter in the URL. E.g., you can send a request to `localhost/v1?name=Paul` to get the following response:  
```json
{
  "data" : "Hello, Paul! 👋",
  "_links" : {
    "self" : "http://127.0.0.1/v1"
  }
}
```

### OpenAPI

You can access the OpenAPI document at `http://localhost/openapi`.  
The Swagger UI is also automatically generated and accessible at `http://localhost/openapi-ui`.

## Continous Integration

The repository contains GitHub Actions to automatically build and test the example web service on a wide variety of platforms and configurations.

### Docker

The template includes docker files and docker compose files to start and deploy a web service.  
In addition, the template includes a GitHub Action that builds a new docker image on every release and pushes the image to the GitHub package registry.  
You can start up the web service using published docker images using `$ docker compose up` using the `docker-compose.yml` file.  
The `docker-compose-development.yml` file can be used to test the setup by building the web service locally using `$ docker compose -f docker-compose-development.yml up`.  
