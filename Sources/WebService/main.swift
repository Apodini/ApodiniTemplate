import Apodini
import ApodiniOpenAPI
import ApodiniREST


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


try ExampleWebService.main()
