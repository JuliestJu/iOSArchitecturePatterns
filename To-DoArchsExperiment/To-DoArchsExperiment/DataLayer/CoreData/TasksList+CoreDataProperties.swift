//
//  TasksList+CoreDataProperties.swift
//  To-DoArchsExperiment
//
//  Created by Юлія Воротченко on 07.11.2023.
//
//

import Foundation
import CoreData


extension TasksList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TasksList> {
        return NSFetchRequest<TasksList>(entityName: "TasksList")
    }

    @NSManaged public var icon: String?
    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var tasks: Task?

}

extension TasksList : Identifiable {

}
