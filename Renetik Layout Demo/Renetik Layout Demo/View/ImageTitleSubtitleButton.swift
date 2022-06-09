import RenetikLayout

class ImageTitleSubtitleButton: CSWrapper<UIView> {

    override class func construct() -> Self {
        super.construct().background(color: .demo_control)
    }

    let contentView = CSView.construct().interaction(enabled: false)
    let presetButtonLooperTrackTitle = UITextView.construct(.dummy_number).styleTitle()
    let imageView = wrap(UIImageView.construct(.chevron_right).tint(color: .demo_text_strong), paddingLeft: 5)
    let textView1 = wrap(UILabel.construct(.dummy_complete).font(.inst_button).text(color: .demo_text_strong)
        , paddingLeft: 5, paddingRight: 5, paddingTop: 3, paddingBottom: 3)
    let textView2 = wrap(UILabel.construct(.dummy_complete).font(.inst_caption).text(color: .demo_text_subtle)
        , paddingLeft: 5, paddingRight: 5, paddingTop: 3, paddingBottom: 5)

    override func onCreateLayout() {
        super.onCreateLayout()
        wrap(contentView)
        contentView.add(view: presetButtonLooperTrackTitle).matchParentWidth().from(top: 0).padding(vertical: 3)
        contentView.add(view: DemoHorizontalLineStrong.constructMedium()).fromPrevious(top: 0).matchParentWidth()
        contentView.add(view: CSView.construct(),
            onCreate: { [unowned self] horizontalView in
                horizontalView.matchParentWidth().fromPrevious(top: 0)
                horizontalView.add(view: imageView.width(100)).from(left: 0, top: 0)
                horizontalView.add(view: CSView.construct(),
                    onCreate: { [unowned self] verticalView in
//                delegate.onOrientationChange { verticalView.updateLayout() }
                        verticalView.fromPrevious(left: 0)
                        verticalView.add(view: textView1,
                            onCreate: { $0.from(left: 0, top: 0).flex(right: 0) },
                            onLayout: { $0.updateWrapped { $0.heightToFit(lines: 2) } })
                        verticalView.add(view: textView2,
                            onCreate: { $0.from(left: 0) },
                            onLayout: { [unowned self] in
                                $0.fromPrevious(top: 0).fill(right: rightInset)
                                    .updateWrapped { $0.heightToFit(lines: 2) }
                            })
                    },
                    onLayout: { verticalView in
                        verticalView.fill(right: 0).heightByLastSubview()
                    }
                )
            },
            onLayout: { [unowned self] horizontalView in
                horizontalView.heightToFit()
                imageView.fill(bottom: 0, flexible: false)
            }
        )
        contentView.heightByLastSubview()
        heightByLastSubview()
    }

    override func onLayoutCreated() {
        super.onLayoutCreated()
        addTouchEffect().onClick {
            logInfo("click")
        }
    }
}

#if DEBUG
    import SwiftUI

    class ImageTitleSubtitleButtonPreview: PreviewProvider, CSPreviewProvider {
        class func preview(in view: UIView) {
            view.add(view: ImageTitleSubtitleButton.construct()).matchParentWidth().heightToFit()
                .background(.demo_control)
        }
    }
#endif
