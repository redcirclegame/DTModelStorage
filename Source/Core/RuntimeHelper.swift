//
//  RuntimeHelper.swift
//  DTModelStorageTests
//
//  Created by Denys Telezhkin on 15.07.15.
//  Copyright (c) 2015 Denys Telezhkin. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

/// This class is used to introspect Swift and Objective-C types, providing necessary mapping information.
public final class RuntimeHelper
{
    /// Recursively unwrap optionals to a single level. This is helpful when dealing with double optionals.
    /// - Parameter any: optional to unwrap
    /// - Returns: unwrapped optional
    public class func recursivelyUnwrapAnyValue(any: Any) -> Any?
    {
        let mirror = _reflect(any)
        if mirror.disposition != .Optional
        {
            return any
        }
        if mirror.count == 0
        {
            return nil
        }
        let (_,some) = mirror[0]
        return recursivelyUnwrapAnyValue(some.value)
    }
}