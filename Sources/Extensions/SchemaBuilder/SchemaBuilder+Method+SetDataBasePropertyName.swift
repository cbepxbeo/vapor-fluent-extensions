/*

Project: FluentExtensions
File: SchemaBuilder+Configure.swift
Created by: Egor Boyko
Date: 16.01.2022
Last Fix: 16.06.2023
Version: 0.0.1

Status: #Complete | #Decorated

*/

import FluentSQL

internal var dataBasePropertyName: String = "database"
internal var dataBaseDriverName: String = "FluentMySQLConfiguration"

extension SchemaBuilder {
    ///Sets the name of the property that stores the type that provides access to the configuration
    public static func setDataBasePropertyName(name: String){
        dataBasePropertyName = name
    }
    ///Sets the name of the desired configuration
    public static func setdataBaseDriverName(name: String){
        dataBaseDriverName = name
    }
}
