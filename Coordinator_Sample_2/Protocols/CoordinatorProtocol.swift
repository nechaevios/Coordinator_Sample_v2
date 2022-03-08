//
//  CoordinatorProtocol.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 08.03.2022.
//

import Foundation

protocol Coordinator {
    associatedtype Destination
    func navigate(to destination: Destination)
}
