//
//  Keychain.swift
//  MoneyTracker
//
//  Created by Banut Raul on 06.06.2023.
//

import Foundation

@propertyWrapper
struct Keychain {
    let key: String
    
    var wrappedValue: String? {
        get {
            return readValue()
        }
        set {
            if let newValue {
                saveValue(newValue)
            } else {
                deleteValue()
            }
        }
    }
    
    private var baseQuery: [CFString: Any] {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ]
        return query
    }
    
    private func readValue() -> String? {
        var query = baseQuery
        query[kSecReturnData] = true
        var result: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &result)
        guard let storedData = result as? Data else {
            return nil
        }
        return String(data: storedData, encoding: .utf8)
    }
    
    private func saveValue(_ value: String) {
        var query = baseQuery
        let valueData = value.data(using: .utf8)
        query[kSecValueData] = valueData
        let saveStatus = SecItemAdd(query as CFDictionary, nil)
        if saveStatus == errSecDuplicateItem {
            updateValue(valueData)
        }
    }
    
    private func updateValue(_ data: Data?) {
        var updateQuery = [CFString: Data]()
        updateQuery[kSecValueData] = data
        SecItemUpdate(baseQuery as CFDictionary, updateQuery as CFDictionary)
    }
    
    private func deleteValue() {
        SecItemDelete(baseQuery as CFDictionary)
    }
}
