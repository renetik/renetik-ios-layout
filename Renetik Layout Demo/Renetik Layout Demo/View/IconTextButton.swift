import RenetikLayout

class IconTextButton: CSWrapper<UIView> {

    class func construct(icon: UIImage, title: String) -> Self {
        construct().padding(left: 10).padding(right: 5).padding(vertical: 5).also {
            $0.imageView.image(icon)
            $0.textView.text(title)
        }.addTouchEffect()
    }

    let contentView = CSView.construct(height: 60)
        .interaction(enabled: false)
    let imageView = UIImageView.construct(.chevron_right)
        .tint(color: .demo_text_strong)
    let textView = UILabel.construct().font(.inst_button)
        .text(color: .demo_text_strong)

    override func onCreateLayout() {
        super.onCreateLayout()
        wrap(contentView)
        contentView.add(view: imageView,
            onCreate: { $0.from(left: 0).width(24).matchParentHeight() })
        contentView.add(view: textView,
            onCreate: { $0.fromPrevious(left: 10).matchParentHeight() },
            onLayout: { $0.fill(right: 0) })
    }
}

#if DEBUG
import SwiftUI
class IconTextButtonPreview: PreviewProvider, CSPreviewProvider {
    class func preview(in view: UIView) {
        view.add(view: IconTextButton.construct(
            icon: .chevron_right, title: .dummy_short))
        .matchParentWidth().heightToFit().background(.demo_control)
    }
}
#endif
