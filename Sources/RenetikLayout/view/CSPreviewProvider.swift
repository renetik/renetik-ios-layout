#if DEBUG
import SwiftUI

public protocol CSPreviewProvider{
    static func preview(in view: UIView)
}

public extension PreviewProvider where Self:CSPreviewProvider {
    static var previews: some View {
        CSViewRepresentable { preview(in: $0) }
//            .previewLayout(.fixed(width:568,height:320)) //TODO
    }
}

struct CSViewRepresentable: UIViewRepresentable {
    
    let function: ArgFunc<UIView>
    
    init(_ function: @escaping ArgFunc<UIView>){
        self.function = function
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.updateLayout()
//        uiView.matchParent()
    }
    
    func makeUIView(context: Context) -> UIView {
        UIView.construct().also { function($0) }
    }
}

#endif
