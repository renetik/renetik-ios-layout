import RenetikLayout

class SwitchButton: CSWrapper<UIView> {
    let isChecked: CSEvent<Bool> = event()
    class func construct(icon: UIImage, title: String) -> Self {
        construct().also {
            $0.titleView.text(title)
            $0.imageView.image(icon)
        }.background(color: .demo_control).addTouchEffect()
    }
    let contentView = CSView.construct().interaction(enabled: false)
    let imageView = UIImageView.construct(.chevron_right)
        .tint(color: .demo_text_strong)
    let titleView = UILabel.construct().font(.demo_button).text(color: .demo_text_strong)
    let switchView = UISwitch.construct()

    override func onCreateLayout() {
        super.onCreateLayout()
        padding(left: 15, right: 5).padding(vertical: 5)
            .wrap(contentView.height(50))

        contentView.add(view: imageView.width(24))
            .from(left: 0).matchParentHeight()

        contentView.add(view: titleView, onCreate: {
            $0.fromPrevious(left: 24).matchParentHeight()
        }, onLayout: { [unowned self] view in
                view.fill(right: 0, from: switchView)
            })
        contentView.add(view: switchView, onLayout: {
            $0.from(right: 15).centeredVertical()
        })
    }

    override func onLayoutCreated() {
        super.onLayoutCreated()
        onClick { [unowned self] in
            switchView.setOn(!switchView.isOn, animated: true)
            isChecked.fire(switchView.isOn)
        }
    }
}

#if DEBUG
    import SwiftUI

    class SwitchButtonPreview: PreviewProvider, CSPreviewProvider {
        static var isPortrait = true
        class func preview(in view: UIView) {
            view.add(view: SwitchButton.construct(
                icon: .chevron_right, title: "Test"))
                .matchParentWidth().background(.demo_control)
        }
    }
#endif
