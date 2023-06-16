/*

Project: FluentExtensions
File: FluentExtensionsError+CreateUUID.swift
Created by: Egor Boyko
Date: 16.01.2022
Last Fix: 16.06.2023
Version: 0.0.1

Status: #Complete | #Decorated

*/

extension FluentExtensionsError {
    enum CreateUUID: Error {
        //Error for the situation when the method is not used with the intended driver
        case unsupportedDataBase(message: String)
        ///Error signaling changes in dependent libraries since the method uses a hack to validate.
        case dataBaseFieldNotFound
        ///Error signaling changes in dependent libraries since the method uses a hack to validate.
        case builderDoesNotContainDatabase
    }
}
