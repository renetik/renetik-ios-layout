import RenetikCore
import RenetikEvent

public protocol CSHasLayoutProtocol {
    var layoutFunctions: CSEvent<Void> { get }
    func updateLayout() -> Self
    func onLayoutSubviewsFirstTime()
    func onCreateLayout()
    func onLayoutCreated()
    func onUpdateLayout()
}

public protocol CSLayoutItemProtocol {
    var isVisibleToLayout: Bool { get }
}
