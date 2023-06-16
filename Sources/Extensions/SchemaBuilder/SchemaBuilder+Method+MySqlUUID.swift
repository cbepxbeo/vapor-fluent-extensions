/*

Project: FluentExtensions
File: SchemaBuilder+Method+MySqlUUID.swift
Created by: Egor Boyko
Date: 16.01.2022
Last Fix: 16.06.2023
Version: 0.0.1

Status: #Complete | #Decorated

*/

import FluentSQL
import SQLKit

extension SchemaBuilder {
    ///Creates an id field with the uuid type (in the database varbinary(16)) and automatic generation of a default value.
    ///- Parameter force: Forced attempt to create a default value
    ///- Note: If the check for the corresponding driver fails, but you are sure that the correct driver and database version
    ///         are being used, you can use the force option.
    ///- Warning: Use with MySQL version 8 and above
    public func mySqlUUID(force: Bool = false) throws -> SchemaBuilder {
        if !force{
            try self.checkDataBaseDriver()
        }
        let raw = SQLRaw("(UUID_TO_BIN(UUID()))")
        return self.field(
            .id,
            .uuid,
            .sql(.default(raw)),
            .identifier(auto: false)
        )
    }
    
    
}
