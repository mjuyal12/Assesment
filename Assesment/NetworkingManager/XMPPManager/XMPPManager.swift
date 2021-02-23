//
//  XMPPManager.swift
//  Assesment
//
//  Created by Mayank Juyal on 21/02/21.
//

import Foundation
import XMPPFramework

enum XMPPManagerError: Error {
    case wrongJID
    
    var message: String {
        switch self {
        case .wrongJID:
            return "Your user name is wrong"
        }
    }
}

class XMPPManager: NSObject {
    
    struct DataSource {
        static let host = "stun.joiint.com"
        static let port: UInt16 = 5222
    }
    
    static let shared = XMPPManager()
    
    private var xmppStream: XMPPStream
    private var password: String?
    
    var authenticationSuccessful: ((Bool) -> Void)?
    
    private override init() {
        xmppStream = XMPPStream()
        xmppStream.hostName = DataSource.host
        xmppStream.hostPort = DataSource.port
        xmppStream.startTLSPolicy = .allowed
        super.init()
        xmppStream.addDelegate(self, delegateQueue: DispatchQueue.main)
    }
    /// Passing Username and Password
    func connectUsername(_ username: String, password: String, completion: @escaping ((Bool)->Void)) throws {
        self.authenticationSuccessful = completion
        guard let userJID = XMPPJID(string: username) else {
            throw XMPPManagerError.wrongJID
        }
        self.password = password
        xmppStream.myJID = userJID
        connect()
    }
    /// Connect to the Server
    func connect() {
        if !xmppStream.isDisconnected {
            authenticationSuccessful?(false)
            return
        }
        do {
            try xmppStream.connect(withTimeout: XMPPStreamTimeoutNone)
        } catch  {
            print(error.localizedDescription)
            authenticationSuccessful?(false)
        }
    }
    
}

// MARK: - XMPPStreamDelegate
extension XMPPManager: XMPPStreamDelegate {
    
    func xmppStreamDidConnect(_ sender: XMPPStream) {
        print("Stream : Connected")
        if let password = password {
            try! sender.authenticate(withPassword: password)
        }
    }
    
    func xmppStreamDidAuthenticate(_ sender: XMPPStream) {
        xmppStream.send(XMPPPresence())
        print("Stream : Authenticated")
        authenticationSuccessful?(true)
    }
    
    func xmppStream(_ sender: XMPPStream, didNotAuthenticate error: DDXMLElement) {
        print(error.jsonContainer)
        authenticationSuccessful?(false)
    }
    
}
