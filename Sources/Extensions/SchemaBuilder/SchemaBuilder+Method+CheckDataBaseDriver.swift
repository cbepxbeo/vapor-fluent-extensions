/*

Project: FluentExtensions
File: SchemaBuilder+Method+CheckDataBaseDriver.swift
Created by: Egor Boyko
Date: 16.01.2022
Last Fix: 17.06.2023
Version: 0.0.1

Status: #Complete | #Decorated

*/

import FluentSQL
#if canImport(MySQLKit)
import MySQLKit
#endif

extension SchemaBuilder {
    internal func checkDataBaseDriver() throws {
        #if !canImport(MySQLKit)
            throw FluentExtensionsError.CreateUUID
                .dependencyMySQLKitNotImported(
                    message: "Required use dependency FluentMySQLDriver"
                )
        #else
        var temp: (Bool, Database?) = (false, nil)
        for child in Mirror(reflecting: self).children {
            if let label = child.label, label == dataBasePropertyName {
                temp.0 = true
                temp.1 = child.value as? Database
                break
            }
        }
        
        if !temp.0 {
            throw FluentExtensionsError.CreateUUID
                .dataBaseFieldNotFound
        }
        
        guard let dataBase = temp.1 else {
            throw FluentExtensionsError.CreateUUID
                .builderDoesNotContainDatabase
        }
        
   
        guard let _ = dataBase as? MySQLKit.MySQLDatabase else {
            throw FluentExtensionsError.CreateUUID
                .unsupportedDataBase(
                    message: "You are using \(dataBase.configuration.type)"
                )
        }
        #endif
    }
}
