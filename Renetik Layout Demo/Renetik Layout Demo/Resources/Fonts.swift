import RenetikLayout

typealias Fonts = UIFont

extension UIFont {
    private func serif() -> UIFont { withTraits(.classModernSerifs) }

    static let inst_headline4_serif_bold =
            UIFont.preferredFont(forTextStyle: .largeTitle).serif().bold()

    static let inst_headline5_bold = UIFont.preferredFont(forTextStyle: .title2).bold()
    static let inst_headline5_serif_bold = inst_headline5_bold.serif()

    static let inst_headline = UIFont.preferredFont(forTextStyle: .title3)
    static let inst_headline_bold = inst_headline.bold()
    static let inst_headline_serif_bold = inst_headline_bold.serif()

    static let inst_subtitle1 = UIFont.preferredFont(forTextStyle: .headline)
    static let inst_subtitle1_bold = inst_subtitle1.bold()
    static let inst_subtitle1_serif_bold = inst_subtitle1_bold.serif()

    static let inst_subtitle2 = UIFont.preferredFont(forTextStyle: .subheadline)
    static let inst_subtitle2_bold = inst_subtitle2.bold()
    static let inst_subtitle2_serif = inst_subtitle2.serif()
    static let inst_subtitle2_serif_bold = inst_subtitle2_serif.bold()

    static let inst_body = UIFont.preferredFont(forTextStyle: .body)
    static let inst_body_bold = inst_body.bold()
    static let inst_body_serif_bold = inst_body_bold.serif()

    static let inst_button = inst_body
    static let inst_button_serif = inst_button.serif()
    static let inst_button_bold = inst_button.bold()
    static let inst_button_serif_bold = inst_button_serif.bold()

    static let inst_caption = UIFont.preferredFont(forTextStyle: .caption1)
    static let inst_caption_bold = inst_caption.bold()
    static let inst_caption_serif = inst_caption.serif()
    static let inst_caption_serif_bold = inst_caption_serif.bold()

    static let inst_overline = UIFont.preferredFont(forTextStyle: .caption2)
    static let inst_overline_bold = inst_overline.bold()
    static let inst_overline_serif = inst_overline.serif()
    static let inst_overline_serif_bold = inst_overline_serif.bold()
}
