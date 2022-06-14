import RenetikCore
import RenetikEvent

public protocol CSHasLayoutProtocol {
    var layoutFunctions: CSEvent<Void> { get }
    func onLayout() -> Self
    func onLayoutSubviewsFirstTime()
    func onCreate()
    func onCreated()
    func onUpdate()
}

public protocol CSLayoutItemProtocol {
    var isVisibleToLayout: Bool { get }
}
