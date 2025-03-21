////
////  WatchConnector.swift
////  CrowTrader
////
////  Created by Jiří Daniel Šuster on 25.10.2024.
////
//
//import Foundation
//import WatchConnectivity
//
//class WatchConnector: NSObject, WCSessionDelegate, ObservableObject{
//    private var session: WCSession
//    @Published var messageText : String = ""
//    @Published var messageDate : Date = .now
//    
//    init(session: WCSession = .default) {
//        self.session = session
//        super.init()
//        session.delegate = self
//        session.activate()
//    }
//    
//    func sendToWatch(){
//        if(session.isReachable){
//            
//            let data : [String : Any] = [
//                "text": messageText,
//                "date": messageDate
//            ]
//            session.sendMessage(data, replyHandler: nil)
//        }else{
//            print("session not reachable")
//        }
//    }
//    
//    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
//        //dosel mi slovnik a ja ho potrebuju rozparsovat
//        print(message)
//        DispatchQueue.main.async{
//            self.messageText = message["text"] as? String ?? ""
//            self.messageDate = message["date"] as? Date ?? .now
//        }
//    }
//    
//    
//    func session(_ session: WCSession, activationDidCompleteWith activationState:WCSessionActivationState, error: (any Error)?) {}
//    func sessionDidBecomeInactive(_ session: WCSession) {}
//    func sessionDidDeactivate(_ session: WCSession) {}
//    
//    
//}
