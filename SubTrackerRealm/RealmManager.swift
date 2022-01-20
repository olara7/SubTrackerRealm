//
//  RealmManager.swift
//  SubTrackerRealm
//
//  Created by Oscar Lara on 1/18/22.
//

import Foundation
import RealmSwift

//class RealmManager conforms to the ObservableObject protocol to allow the entire application or
//all views connected to the RealmManager class to be notified of changes in this class
class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var subs: [Sub] = []
    
    init() {
        openRealm()
        getSubs() //get subs on init
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 2)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        } catch {
            print("Error opening realm: \(error)")
        }
    }
    
    func addSub(subTitle: String, subPrice: Double, subRenewalDay: Int) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newSub = Sub(value: ["title": subTitle, "price": subPrice, "active": true, "renewDay": subRenewalDay])
                    localRealm.add(newSub)
                    getSubs() //refresh subs to get newest sub added
                    print("Added new sub to Realm: \(newSub)")
                }
            } catch {
                print("Error adding task to Realm: \(error)")
            }
        }
    }
    
    func getSubs() {
        if let localRealm = localRealm {
            //get all Sub objects
            let allSubs = localRealm.objects(Sub.self).sorted(byKeyPath: "renewDay")
            let allSubs2 = allSubs.sorted(byKeyPath: "active", ascending: false)
            subs = []
            allSubs2.forEach { sub in
                subs.append(sub)
            }
        }
    }
    
    func updateSub(id: ObjectId, active: Bool) {
        if let localRealm  = localRealm {
            do {
                let subToUpdate = localRealm.objects(Sub.self).filter(NSPredicate(format: "id == %@", id))
                guard !subToUpdate.isEmpty else { return }
                
                try localRealm.write {
                    subToUpdate[0].active = active
                    getSubs()
                    print("Updated sub with id \(id)! Active status: \(active)")
                }
            } catch {
                print("Error updating sub \(id) to Realm: \(error)")
            }
        }
    }
    
    func deleteSub(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let subToDelete = localRealm.objects(Sub.self).filter(NSPredicate(format: "id == %@", id))
                guard !subToDelete.isEmpty else { return }
                
                try localRealm.write {
                    localRealm.delete(subToDelete)
                    getSubs()
                    print("Deleted sub with id: \(id)")
                }
            } catch {
                print("Error deleting sub \(id) from Realm: \(error)")
            }
        }
    }
}
