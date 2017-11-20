//
//  Memeable.swift
//  William_CSP
//
//  Created by Pearson, William on 11/20/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import Foundation
public protocol Memeable
{
    var memeState : Bool {get set}
    func meme() -> Void
    func isMemed() -> Bool
}
