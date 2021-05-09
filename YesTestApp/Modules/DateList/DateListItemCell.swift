//
//  DateListItemCell.swift
//  YesTestApp
//
//  Created by Владислав Афанасьев on 09.05.2021.
//

import Reusable
import UIKit

class DateListItemCell: TableViewCell, Reusable {

    // MARK: - Private Fields

    private let descriptionLabel = UILabel().prepare { label in
        label.lineBreakMode = .byClipping
        label.numberOfLines = 0
    }

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    // MARK: - Public Methods

    func fill(with date: DateDetails) {
        descriptionLabel.text = date.eventDescription.isEmpty ? "Empty :(" : date.eventDescription
    }

    // MARK: - Private Methods

    private func setup() {
        selectionStyle = .none
        
        contentView.addSubview(descriptionLabel)

        descriptionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
}
