public extension UITableView {
    func cell(style: UITableViewCell.CellStyle,
              onCreate: ((UITableViewCell) -> Void)? = nil) -> UITableViewCell {
        cell(with: "Cell", style: style, onCreate: onCreate)
    }

    func cell(with identifier: String, style: UITableViewCell.CellStyle,
              onCreate: ((UITableViewCell) -> Void)? = nil) -> UITableViewCell {
        var cell = dequeueCellWith(identifier: identifier)
        if cell.isNil {
            cell = UITableViewCell(style: style, reuseIdentifier: identifier)
            onCreate?(cell!.construct())
        }
        return cell!
    }

    private func dequeue<CellType: UITableViewCell>(cell type: CellType.Type) -> CellType {
        let cell = dequeueCellWith(identifier: type.className()) as? CellType
        return cell.isNil ? register(cell: type).dequeueCellWith(identifier: type.className()) as! CellType : cell!
    }

    func dequeue<CellType: UITableViewCell>(
        cell type: CellType.Type, onCreate: ((CellType) -> Void)? = nil) -> CellType {
        let cell = dequeue(cell: type)
        if cell.contentView.isEmpty {
            onCreate?(cell)
//            cell.contentView.matchParent()
//            cell.width(width, height: width)
            cell.construct()
        }
        return cell
    }
}
