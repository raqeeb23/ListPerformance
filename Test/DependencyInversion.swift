//
//  DependencyInversion.swift
//  Test
//
//  Created by Shaikh Rakib on 16/04/24.
//

import Foundation


class ViewModel {
    var repo: RepositoryProtocol
    
    init(repo: RepositoryProtocol) {
        self.repo = repo
    }
}


protocol RepositoryProtocol  {
    func doThis()
}

class RepositoryImplementation: RepositoryProtocol {
    func doThis() {
        
    }
}

class MockImplementation: RepositoryProtocol {
    func doThis() {
        
    }
}



let viewmodel = ViewModel(repo: MockImplementation())
