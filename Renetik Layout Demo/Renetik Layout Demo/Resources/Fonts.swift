import RenetikLayout

typealias Fonts = UIFont

extension UIFont {
    private func serif() -> UIFont { withTraits(.classModernSerifs) }

    static let demo_headline4_serif_bold =
            UIFont.preferredFont(forTextStyle: .largeTitle).serif().bold()

    static let demo_headline5_bold = UIFont.preferredFont(forTextStyle: .title2).bold()
    static let demo_headline5_serif_bold = demo_headline5_bold.serif()

    static let demo_headline = UIFont.preferredFont(forTextStyle: .title3)
    static let demo_headline_bold = demo_headline.bold()
    static let demo_headline_serif_bold = demo_headline_bold.serif()

    static let demo_subtitle1 = UIFont.preferredFont(forTextStyle: .headline)
    static let demo_subtitle1_bold = demo_subtitle1.bold()
    static let demo_subtitle1_serif_bold = demo_subtitle1_bold.serif()

    static let demo_subtitle2 = UIFont.preferredFont(forTextStyle: .subheadline)
    static let demo_subtitle2_bold = demo_subtitle2.bold()
    static let demo_subtitle2_serif = demo_subtitle2.serif()
    static let demo_subtitle2_serif_bold = demo_subtitle2_serif.bold()

    static let demo_body = UIFont.preferredFont(forTextStyle: .body)
    static let demo_body_bold = demo_body.bold()
    static let demo_body_serif_bold = demo_body_bold.serif()

    static let demo_button = demo_body
    static let demo_button_serif = demo_button.serif()
    static let demo_button_bold = demo_button.bold()
    static let demo_button_serif_bold = demo_button_serif.bold()

    static let demo_caption = UIFont.preferredFont(forTextStyle: .caption1)
    static let demo_caption_bold = demo_caption.bold()
    static let demo_caption_serif = demo_caption.serif()
    static let demo_caption_serif_bold = demo_caption_serif.bold()

    static let demo_overline = UIFont.preferredFont(forTextStyle: .caption2)
    static let demo_overline_bold = demo_overline.bold()
    static let demo_overline_serif = demo_overline.serif()
    static let demo_overline_serif_bold = demo_overline_serif.bold()
}
