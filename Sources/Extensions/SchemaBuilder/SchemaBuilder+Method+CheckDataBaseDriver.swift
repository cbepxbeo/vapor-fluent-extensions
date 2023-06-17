/*

Project: FluentExtensions
File: SchemaBuilder+Method+CheckDataBaseDriver.swift
Created by: Egor Boyko
Date: 16.01.2022
Last Fix: 16.06.2023
Version: 0.0.1

Status: #Complete | #Decorated

*/

import FluentSQL

extension SchemaBuilder {
    internal func checkDataBaseDriver() throws {
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
        
        if dataBase.configuration.type != dataBaseDriverName {
            throw FluentExtensionsError.CreateUUID
                .unsupportedDataBase(
                    message: dataBase.configuration.type
                )
        }
        
    }
}
