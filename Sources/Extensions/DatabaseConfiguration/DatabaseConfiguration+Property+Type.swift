/*

Project: FluentExtensions
File: DatabaseConfiguration+Property+Type.swift
Created by: Egor Boyko
Date: 16.01.2022
Last Fix: 16.06.2023
Version: 0.0.1

Status: #Complete | #Decorated

*/

import FluentSQL

extension DatabaseConfiguration {
    internal var type: String {
        String(describing: Self.self)
    }
}

