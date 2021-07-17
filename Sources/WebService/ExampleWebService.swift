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
