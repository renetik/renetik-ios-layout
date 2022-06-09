#if DEBUG
import SwiftUI

public class CSPreviewDimension {
    public static let
    iPhoneX = CSPreviewDimension((375, 812)),
    iPhone8 = CSPreviewDimension((375, 667)),
    iPhone6sPlus = CSPreviewDimension((375, 667)),
    iPhone6s = CSPreviewDimension((375, 667)),
    iPhoneSE = CSPreviewDimension((320, 568)),
    iPadPro12_2nd = CSPreviewDimension((1024, 1366)),
    iPadPro = CSPreviewDimension((768, 1024))
    
    public let dimension: (width: CGFloat, height: CGFloat)
    
    public init(_ dimension: (width: CGFloat, height: CGFloat)) { self.dimension = dimension }
    
    public static var All = [iPhoneSE]
}

public protocol CSPreviewProvider {
//    static var device: CSPreviewDevice? { get }
    static var dimension: CSPreviewDimension { get }
    static var isPortrait: Bool { get }
    static func preview(in view: UIView)
}

public extension PreviewProvider where Self: CSPreviewProvider {
//    static var device: CSPreviewDevice? { nil }
    static var dimension: CSPreviewDimension { .iPhone8 }
    static var isPortrait: Bool { true }
    static var previews: some View {
        CSViewRepresentable { preview(in: $0) }
            .previewLayout(layout)
//            .previewDevice(PreviewDevice(rawValue: device.rawValue))
//            .previewInterfaceOrientation(.landscapeLeft) // from iOS 15
    }
    static var layout: PreviewLayout {
        isPortrait ? .fixed(width: dimension.dimension.width, height: dimension.dimension.height) :
            .fixed(width: dimension.dimension.height, height: dimension.dimension.width)
    }
}

final class CSViewRepresentable: CSObject, UIViewRepresentable {
    
    let function: ArgFunc<UIView>
    
    init(_ function: @escaping ArgFunc<UIView>) {
        self.function = function
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.updateLayout()
    }
    
    func makeUIView(context: Context) -> UIView {
        UIView.construct().also { function($0) }.background(.systemBackground)
    }
}

public enum CSPreviewDevice: String, CaseIterable {
    case iPod_touch_5th_generation = "iPod touch (5th generation)"
    case iPod_touch_6th_generation = "iPod touch (6th generation)"
    case iPod_touch_7th_generation = "iPod touch (7th generation)"
    case iPhone_4 = "iPhone 4"
    case iPhone_4s = "iPhone 4s"
    case iPhone_5 = "iPhone 5"
    case iPhone_5c = "iPhone 5c"
    case iPhone_5s = "iPhone 5s"
    case iPhone_6 = "iPhone 6"
    case iPhone_6_Plus = "iPhone 6 Plus"
    case iPhone_6s = "iPhone 6s"
    case iPhone_6s_Plus = "iPhone 6s Plus"
    case iPhone_7 = "iPhone 7"
    case iPhone_7_Plus = "iPhone 7 Plus"
    case iPhone_8 = "iPhone 8"
    case iPhone_8_Plus = "iPhone 8 Plus"
    case iPhone_X = "iPhone X"
    case iPhone_XS = "iPhone XS"
    case iPhone_XS_Max = "iPhone XS Max"
    case iPhone_XR = "iPhone XR"
    case iPhone_11 = "iPhone 11"
    case iPhone_11_Pro = "iPhone 11 Pro"
    case iPhone_11_Pro_Max = "iPhone 11 Pro Max"
    case iPhone_12_mini = "iPhone 12 mini"
    case iPhone_12 = "iPhone 12"
    case iPhone_12_Pro = "iPhone 12 Pro"
    case iPhone_12_Pro_Max = "iPhone 12 Pro Max"
    case iPhone_13_mini = "iPhone 13 mini"
    case iPhone_13 = "iPhone 13"
    case iPhone_13_Pro = "iPhone 13 Pro"
    case iPhone_13_Pro_Max = "iPhone 13 Pro Max"
    case iPhone_SE = "iPhone SE"
    case iPhone_SE_2nd_generation = "iPhone SE (2nd generation)"
    case iPhone_SE_3rd_generation = "iPhone SE (3rd generation)"
    case iPad_2 = "iPad 2"
    case iPad_3rd_generation = "iPad (3rd generation)"
    case iPad_4th_generation = "iPad (4th generation)"
    case iPad_5th_generation = "iPad (5th generation)"
    case iPad_6th_generation = "iPad (6th generation)"
    case iPad_7th_generation = "iPad (7th generation)"
    case iPad_8th_generation = "iPad (8th generation)"
    case iPad_9th_generation = "iPad (9th generation)"
    case iPad_Air = "iPad Air"
    case iPad_Air_2 = "iPad Air 2"
    case iPad_Air_3rd_generation = "iPad Air (3rd generation)"
    case iPad_Air_4th_generation = "iPad Air (4th generation)"
    case iPad_Air_5th_generation = "iPad Air (5th generation)"
    case iPad_mini = "iPad mini"
    case iPad_mini_2 = "iPad mini 2"
    case iPad_mini_3 = "iPad mini 3"
    case iPad_mini_4 = "iPad mini 4"
    case iPad_mini_5th_generation = "iPad mini (5th generation)"
    case iPad_mini_6th_generation = "iPad mini (6th generation)"
    case iPad_Pro_9_7_inch = "iPad Pro (9.7-inch)"
    case iPad_Pro_10_5_inch = "iPad Pro (10.5-inch)"
}

#endif
