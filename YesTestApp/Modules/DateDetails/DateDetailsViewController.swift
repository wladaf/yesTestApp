//
//  DateDetailsViewController.swift
//  YesTestApp
//
//  Created by Владислав Афанасьев on 09.05.2021.
//

import UIKit

class DateDetailsViewController: ViewController {

    // MARK: - Private Fields

    private let dateDetails: DateDetails

    private var dateDetailsView: DateDetailsView? {
        view as? DateDetailsView
    }

    // MARK: - Lifecycle

    init(dateDetails: DateDetails) {
        self.dateDetails = dateDetails
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) has not been implemented")
    }

    override func loadView() {
        view = DateDetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dateDetailsView?.set(date: dateDetails)
    }
}
