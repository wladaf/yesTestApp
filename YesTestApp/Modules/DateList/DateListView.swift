//
//  DateListView.swift
//  YesTestApp
//
//  Created by Владислав Афанасьев on 08.05.2021.
//

import Reusable
import SnapKit
import UIKit

protocol DateListViewDelegate: AnyObject {
    func didSelect(date: DateDetails)
}

class DateListView: View {

    // MARK: - Public Fields

    weak var delegate: DateListViewDelegate?

    // MARK: - Private Fields

    private let loader = UIActivityIndicatorView(style: .large)

    private let tableView = UITableView().prepare { tableView in
        tableView.register(cellType: DateListItemCell.self)
    }

    private var dates: [DateDetails] = []

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    // MARK: - Public Methods

    func update(with dateDetails: [DateDetails]) {
        self.dates = dateDetails
        tableView.reloadData()
    }

    func set(loading isLoading: Bool) {
        loader.isHidden = !isLoading
        isLoading ? loader.startAnimating() : loader.stopAnimating()
        tableView.isHidden = isLoading
    }

    // MARK: - Private Methods

    private func setup() {
        backgroundColor = UIColor.white

        tableView.delegate = self
        tableView.dataSource = self
        
        addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }

        addSubview(loader)

        loader.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}

extension DateListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dateDetails = dates[indexPath.item]
        delegate?.didSelect(date: dateDetails)
    }
}

extension DateListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DateListItemCell = tableView.dequeueReusableCell(for: indexPath)
        let dateDetails = dates[indexPath.item]
        cell.fill(with: dateDetails)
        return cell
    }
}
