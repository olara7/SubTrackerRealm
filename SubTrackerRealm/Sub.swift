//
//  Sub.swift
//  SubTrackerRealm
//
//  Created by Oscar Lara on 1/18/22.
//

import Foundation
import RealmSwift

class Sub: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey:  true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var price = 0.0
    @Persisted var active = true
    @Persisted var renewDay = 0
}
