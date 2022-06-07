#if DEBUG
import SwiftUI

public protocol CSPreviewProvider{
    static func function(_ view:UIView)
}

public extension PreviewProvider where Self:CSPreviewProvider {
    static var previews: some View {
        CSViewRepresentable { function($0) }
    }
}

struct CSViewRepresentable: UIViewRepresentable {
    
    let function: ArgFunc<UIView>
    
    init(_ function: @escaping ArgFunc<UIView>){
        self.function = function
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.updateLayout()
    }
    
    func makeUIView(context: Context) -> UIView {
        UIView.construct().also { function($0) }
    }
}

#endif
