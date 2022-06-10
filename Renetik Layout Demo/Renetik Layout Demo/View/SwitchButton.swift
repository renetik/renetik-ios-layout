import RenetikLayout

class SwitchButton: CSWrapper<UIView> {
    class func construct(icon: UIImage, title: String) -> Self {
        construct().padding(left: 15, right: 5).padding(vertical: 5).also {
            $0.titleView.text(title)
            $0.imageView.image(icon)
        }.background(color: .demo_control)
    }

    let contentView = CSView.construct(height: 50).interaction(enabled: false)
    let imageView = UIImageView.construct(.chevron_right).tint(color: .demo_text_strong)
    let titleView = UILabel.construct().font(.demo_button).text(color: .demo_text_strong)
    let switchView = UISwitch.construct()

    override func onCreateLayout() {
        super.onCreateLayout()
        wrap(contentView)
        contentView.add(view: imageView, onCreate: {
            $0.from(left: 0).width(24).matchParentHeight()
        })
        contentView.add(view: titleView, onCreate: {
            $0.fromPrevious(left: 24).matchParentHeight()
        }, onLayout: { [unowned self] view in
            view.fill(right: 0, from: switchView)
        })
        contentView.add(view: switchView, onLayout: { [unowned self] in
            $0.from(right: rightInset).centeredVertical()
        })
    }

    override func onLayoutCreated() {
        super.onLayoutCreated()
        addTouchEffect()
        onClick { [unowned self] in switchView.setOn(!switchView.isOn, animated: true) }
    }
}

#if DEBUG
import SwiftUI

class SwitchButtonPreview: PreviewProvider, CSPreviewProvider {
    class func preview(in view: UIView) {
        view.add(view: SwitchButton.construct(
                icon: .chevron_right, title: "Test"))
            .matchParentWidth().background(.demo_control)
    }
}
#endif
