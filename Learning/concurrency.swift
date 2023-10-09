//
//  async.swift
//  Learning
//
//  Created by Diego Sánchez on 08/10/2023.
//

import Foundation

func concurrencyMain() async {
    @Sendable func fetchUserId(from server: String) async -> Int {
        if server == "primary" {
            return 97
        }
        return 501
    }

    @Sendable func fetchUsername(from server: String) async -> String {
        let userID = await fetchUserId(from: server)
        if userID == 501 {
            return "John"
        }
        return "Guest"
    }

    func connectUser(to server: String) async {
        async let userID = fetchUserId(from: server)
        async let username = fetchUsername(from: server)
        let greeting = await "Hello \(username), user ID \(userID)"
        print(greeting)
    }

    //Task {
    //    await connectUser(to: "primary")
    //}

    let userIDs = await withTaskGroup(of: Int.self) { taskGroup in
        for server in ["primary", "secondary", "development"] {
            taskGroup.addTask {
                return await fetchUserId(from: server)
            }
        }
        
        var results: [Int] = []
        for await result in taskGroup {
            results.append(result)
        }
        
        return results
    }

    print(userIDs)

    actor ServerConnection {
        var server: String = "primary"
        private var activeUsers: [Int] = []
        func connect() async -> Int {
            let userID = await fetchUserId(from: server)
            
            activeUsers.append(userID)
            return userID
        }
    }


    let server = ServerConnection()
    let userID = await server.connect()

    print("Actor \(userID)")

}
