import Apodini


struct Greeter: Handler {
    @Parameter var name: String = "World"
    
    
    func handle() -> String {
        "Hello, \(name)! 👋"
    }
}
