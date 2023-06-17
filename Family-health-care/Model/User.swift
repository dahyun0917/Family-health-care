//
//  User.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/24.
//

import Foundation
import FirebaseFirestore

final class User: ObservableObject {
    @Published var walk: Int = 0
    @Published var userName: String = ""
    @Published var userId: String = ""
    @Published var image: String = ""
    @Published var promise: [Promise] = []
    @Published var medicineState: [MedicineState] = []
    @Published var height: Int = 0
    @Published var weight: Int = 0
    @Published var family: String = ""
    private let token: String

    init(token: String, completion: @escaping (User) -> Void) {
        self.token = token
        fetchFields(token: token) {
            self.fetchPromise(token: token) {
                self.fetchMedicine(token: token) {
                    completion(self)
                }
            }
        }
    }

    func fetchFields(token: String, completion: @escaping () -> Void) {
        let db = Firestore.firestore()
        // user information
        db.collection("users").document(token).getDocument { (doc, error) in
            guard error == nil, let doc = doc, doc.exists else{
                print("Error: \(error?.localizedDescription ?? "")")
                return
            }
            let info = doc.data()
            if let info = info{
                //print(info)
                if let walk = info["walk"] as? NSNumber{
                    self.walk = walk.intValue
                }
                
                
                if let height = info["height"] as? NSNumber, let weight = info["weight"] as? NSNumber{
                    self.height = height.intValue
                    self.weight = weight.intValue
                }
                
                if let image = info["profileImage"] as? String{
                    self.image = image
                }
                
                if let userName = info["userName"] as? String{
                    self.userName = userName
                }
                
                if let userId = info["userId"] as? String{
                    self.userId = userId
                }
            }
            completion()
        }
    }

    func fetchPromise(token: String, completion: @escaping () -> Void) {
        let db = Firestore.firestore()

        let promises = db.collection("users").document(token).collection("promises").order(by: "promiseDate")
        promises.getDocuments { (querySnapshot, err) in
            guard err == nil , let querySnapshot = querySnapshot else{
                print("Error: \(err?.localizedDescription ?? "")")
                return
            }
            for document in querySnapshot.documents{
                guard let timestamp = document["promiseDate"] as? Timestamp else{
                    print("Error : Unable to cast 'time' to Timestamp")
                    continue
                }
                let promiseID = document.documentID
                let promiseContents = document.data()["promiseContents"] as? String ?? ""
                let complete = document.data()["complete"] as? Bool ?? false
                self.promise.append(Promise(promiseID: promiseID, promiseDetail: promiseContents, promiseDate: timestamp.dateValue(), isCompleted: complete))
            }
            completion()
        }
    }

    func fetchMedicine(token: String, completion: @escaping () -> Void) {
        let db = Firestore.firestore()

        let medicines = db.collection("users").document(token).collection("medicines")
        medicines.getDocuments { (querySnapshot, err) in
            guard err == nil , let querySnapshot = querySnapshot else{
                print("Error: \(err?.localizedDescription ?? "")")
                return
            }
            for document in querySnapshot.documents{
                let medicineName = document.data()["medicineName"] as? String ?? ""
                let complete = document.data()["complete"] as? Bool ?? false
                let time = document.data()["time"] as? String ?? ""
                
                self.medicineState.append(MedicineState(medicineName: medicineName, time: time, isComplete: complete))
            }
            completion()
        }
    }
    
    func uploadWalk(data: Int) {
        let db = Firestore.firestore()
        db.collection("users").document(token).updateData([
            "walk": data
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                self.walk = data
            }
        }
    }
    
    func uploadWeightHeight(dataWeight: Int, dataHeight: Int) {
        let db = Firestore.firestore()
        db.collection("users").document(token).updateData([
            "weight": dataWeight,
            "height": dataHeight
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                self.weight = dataWeight
                self.height = dataHeight
            }
        }
    }
    
    func uploadPromise(dataDetail: String, dataDate: Date, dataComplete:Bool) {
        let db = Firestore.firestore()
        if self.promise.count>0 {
            db.collection("users").document(token).collection("promises").document(self.promise[self.promise.count-1].promiseID).updateData([
                "complete": dataComplete,
                "promiseContents": dataDetail,
                "promiseDate": dataDate
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    if self.promise.count > 0 {
                        self.promise[self.promise.count-1].promiseDetail = dataDetail
                        self.promise[self.promise.count-1].promiseDate = dataDate
                        self.promise[self.promise.count-1].isCompleted = dataComplete
                    }
                }
            }
        }
    }
    
    func addPromise(data: Promise) {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil // ref를 Optional로 선언
        ref = db.collection("users").document(token).collection("promises").addDocument(data: [
            "complete": data.isCompleted,
            "promiseContents": data.promiseDetail,
            "promiseDate": data.promiseDate
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                self.promise.append(data)
                if self.promise.count > 0 {
                    self.promise[self.promise.count-1].promiseID = ref!.documentID
                }
            }
        }
    }
}

import Combine

class UserLoader: ObservableObject {
    @Published var user: User? = nil
    private var cancellables = Set<AnyCancellable>()

    init(token: String) {
        let _ = User(token: token) { user in
            DispatchQueue.main.async {
                user.objectWillChange
                    .sink { [weak self] _ in
                        self?.objectWillChange.send()
                    }
                    .store(in: &self.cancellables)
                self.user = user
            }
        }
    }
}
