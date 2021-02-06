import UIKit

// 12-3 접근수준을 명기한 각 요소들의 예
open class openClass {
    open var openProperty: Int = 0
    public var publicProperty: Int = 0
    internal var internalproperty: Int = 0
    fileprivate var fileprivateproperty: Int = 0
    private var privateProperty: Int = 0
    
    open func openMethod() {}
    public func publicMethod() {}
    internal func internalMethod() {}
    fileprivate func fileprivateMethod() {}
    private func privateMethod() {}
}

public class PublicClass {}
public struct PublicStruct {}
public enum PublicEnum {}
public var publicVa = 0
public let publicLet = 0
public func publicfunc() {}

internal class InternalClass {} // internal 키워드는 생략해도 무관합니다.

fileprivate class FilePrivateClass {}

private class PrivateClass {}
