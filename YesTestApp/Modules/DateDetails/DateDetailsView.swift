//
//  DateDetailsView.swift
//  YesTestApp
//
//  Created by Владислав Афанасьев on 08.05.2021.
//

import SnapKit
import UIKit

class DateDetailsView: View {

    private let nameLabel = UILabel().prepare { label in
        label.numberOfLines = 0
    }

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

    func set(date: DateDetails) {
        nameLabel.text = date.eventDescription.isEmpty ? "No description" : date.eventDescription
    }

    // MARK: - Private Methods

    private func setup() {
        backgroundColor = UIColor.white

        addSubview(nameLabel)

        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(12)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
    }
}
