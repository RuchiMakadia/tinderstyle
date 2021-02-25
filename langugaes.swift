//
//  langugaes.swift
//  tinderStyle
//
//  Created by eHeuristic on 25/02/21.
//

import Foundation

extension String {
    func localized(_ lang: String)-> String {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

//use
//label.text =  "ViewController_Label_Hello".localized("en")
