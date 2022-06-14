import RenetikLayout

extension UIViewController: CSHasDialogProtocol {
    public func show(title: String?, message: String,
        positive: CSDialogAction?, negative: CSDialogAction?,
        cancel: CSDialogAction?) -> CSHasDialogVisible {
        CSAlertDialog(in: self).show(title: title, message: message,
            positive: positive, negative: negative, cancel: cancel)
    }
}
