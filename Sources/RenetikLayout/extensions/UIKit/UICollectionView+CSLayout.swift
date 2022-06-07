public extension UICollectionView {
    @discardableResult
    override func construct() -> Self {
        super.construct()
        return background(.clear)
    }

    @discardableResult
    func construct(_ parent: UICollectionViewDelegate & UICollectionViewDataSource) -> Self {
        construct()
        delegates(parent)
        registerDefaultCell()
        reloadData()
        return self
    }

    func dequeue<CellType: UICollectionViewCell>(
        cell cellType: CellType.Type, _ path: IndexPath, onCreate: ((CellType) -> Void)? = nil) -> CellType {
        let cell = dequeueReusableCell(withReuseIdentifier: cellType.className(), for: path) as! CellType
        if cell.contentView.isEmpty {
//            cell.contentView.matchParent()
            cell.construct()
            onCreate?(cell)
        }
        return cell
    }
}
