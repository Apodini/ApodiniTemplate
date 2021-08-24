//
// This source file is part of the Apodini Template open source project
//
// SPDX-FileCopyrightText: 2021 Paul Schmiedmayer and the project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import Apodini


struct Greeter: Handler {
    @Parameter var name: String = "World"
    
    
    func handle() -> String {
        "Hello, \(name)! 👋"
    }
}
