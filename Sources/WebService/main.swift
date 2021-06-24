import Apodini
import ApodiniOpenAPI
import ApodiniREST


struct ExampleWebService: WebService {
    var configuration: Configuration {
        REST {
            OpenAPI()
        }
    }

    var content: some Component {
        Greeter()
    }
}


ExampleWebService.main()
