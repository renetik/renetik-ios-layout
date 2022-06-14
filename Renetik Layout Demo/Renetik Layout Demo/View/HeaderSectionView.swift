import RenetikLayout

class HeaderSectionView: CSView {
    
    override class func construct() -> Self {
        super.construct().background(color: .demo_control)
    }
    let header = wrap(UILabel.construct("App")).styleHeader()
    let buttons = ButtonsView.construct()

    override func onCreateLayout() {
        super.onCreateLayout()
        add(view: header).matchParentWidth().from(top: 0)
        add(view: HorizontalLineStrong.constructMedium())
            .fromPrevious(top: 0).matchParentWidth()
        add(view: buttons).fromPrevious(top: 0).matchParentWidth()
        heightByLastSubview()
    }
}

#if DEBUG
    import SwiftUI
    class AppPreview: PreviewProvider, CSPreviewProvider {
        class func preview(in window: UIView) {
            window.add(window: HeaderSectionView.construct())
                .matchParentWidth().heightToFit()
        }
    }
#endif

