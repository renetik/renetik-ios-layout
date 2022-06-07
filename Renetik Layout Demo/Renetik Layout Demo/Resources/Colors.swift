import RenetikLayout

typealias Colors = UIColor

public extension UIColor {
    static let demo_surface = UIColor("#232525")!
    static let demo_panel = UIColor("#383838")!
    static let demo_control = UIColor("#414141")!
    static let demo_control_pressed = UIColor("#00695C")!
    static let demo_control_selected = UIColor("#2979FF")!
    static let demo_control_selected_pressed = UIColor("#03598E")!
    static let demo_control_active = UIColor("#6200EA")!
    static let demo_control_active_foreground = UIColor("#F57F17")!

    static let demo_text_strong = UIColor("#FCFCFC")!
    static let demo_text_subtle = UIColor("#F5F0F5")!
    static let demo_text_pressed = UIColor("#A7A7A7")!
    static let demo_text_selected = UIColor("#FFFFFF")!
    static let demo_text_on_dark = demo_text_strong
    static let demo_text_on_dark_subtle = demo_text_subtle

    static let demo_border = UIColor("#272525")!
    static let demo_border_strong = UIColor("#232525")!

    static let demo_key_piano_primary = UIColor("#1E1E1E")!
    static let demo_key_piano_primary_pressed = UIColor("#272727")!
    static let demo_key_piano_primary_text = demo_text_strong
    static let demo_key_piano_primary_text_subtle = demo_text_subtle

    static let demo_key_piano_secondary = UIColor("#595959")!
    static let demo_key_piano_secondary_pressed = UIColor("#323232")!

    static let demo_key_primary = UIColor("#595959")!
    static let demo_key_primary_pressed = UIColor("#323232")!
    static let demo_key_primary_text = demo_text_strong
    static let demo_key_primary_text_subtle = demo_text_subtle

    static let demo_key_secondary = demo_key_piano_primary
    static let demo_key_secondary_pressed = demo_key_piano_primary_pressed
    static let demo_key_secondary_selected = UIColor("#0D38AD")!
    static let demo_key_secondary_text = demo_key_piano_primary_text

    static let demo_split_controller_split = demo_surface
}
