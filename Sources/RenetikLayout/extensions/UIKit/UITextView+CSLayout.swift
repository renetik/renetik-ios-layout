public extension UITextView {
    @discardableResult
    func padding(vertical value: Int) -> Self {
        heightToFit().add(height: CGFloat(value * 2)).alignContentCenter()
        return self
    }
    
    @discardableResult
    func heightToFit(lines numberOfLines: Int) -> Self {
        let currentWidth = width; let currentText = text; var linesText = "line"
        for _ in 0..<numberOfLines - 1 { linesText += "\n line" }
        text(linesText).resizeToFit().text(currentText).width(currentWidth)
        return self
    }
}
