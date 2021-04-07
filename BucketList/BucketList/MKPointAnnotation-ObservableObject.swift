//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Hubert Leszkiewicz on 14/03/2021.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        } set {
            title = newValue
        }
    }
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        } set {
            subtitle = newValue
        }
    }
}
