import RenetikLayout

class ExpandButton: CSWrapper<UIView> {
    class func construct(_ text: String) -> Self {
        construct().padding(left: 15).padding(right: 5).padding(vertical: 5)
            .also { $0.titleView.text(text) }
            .background(.demo_control).addTouchEffect()
    }
    let contentView = CSView.construct(height: 50)
    let titleView = UILabel.construct().font(.demo_button)
        .text(color: .demo_text_strong)
    let imageView = UIImageView.construct(.chevron_right)
        .tint(color: .demo_text_strong).size(30)

    override func onCreate() {
        super.onCreate()
        contentView.add(view: titleView, onCreate: {
            $0.from(left: 0).matchParentHeight()
        }, onLayout: { [unowned self] in $0.fill(right: 0, from: imageView) })
        
        contentView.add(view: imageView, onCreate: {
            $0.centeredVertical()
        }, onLayout: { $0.from(right: 15) })
        
        wrap(contentView)
    }
}
#if DEBUG
    import SwiftUI
    class ExpandButtonPreview: PreviewProvider, CSPreviewProvider {
        class func preview(in window: UIView) {
            window.add(view: ExpandButton.construct(.dummy_two_word))
                .matchParentWidth().heightToFit()
        }
    }
#endif
