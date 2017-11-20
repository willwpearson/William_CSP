//
//  DonaldTrump.swift
//  William_CSP
//
//  Created by Pearson, William on 11/20/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit
public class TrumpMemes : Memeable
{
    private var trumpColor :UIColor
    //MARK: Memeable data member
    public var memeState: Bool
    
    public init()
    {
        self.trumpColor = UIColor()
        self.memeState = false
    }
    
    //MARK:- Memeable methods
    public func meme() -> Void
    {
        print("I am now meme xD")
        memeState = true
    }
    
    public func isMemed() -> Bool
    {
        if(memeState)
        {
            print("Memed")
        }
        else
        {
            print("Impossible to meme")
        }
        return memeState
    }
}
