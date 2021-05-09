//
//  DateListViewController.swift
//  YesTestApp
//
//  Created by Владислав Афанасьев on 09.05.2021.
//

import UIKit

class DateListViewController: ViewController {

    // MARK: - Private Fields

    private let provider: ProviderProtocol
    private let wireframe: WireframeProtocol

    private var dateListView: DateListView? {
        view as? DateListView
    }

    // MARK: - Lifecycle

    init(provider: ProviderProtocol, wireframe: WireframeProtocol) {
        self.provider = provider
        self.wireframe = wireframe
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) has not been implemented")
    }

    override func loadView() {
        view = DateListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dateListView?.delegate = self

        dateListView?.set(loading: true)

        provider.request(
            .getDateList,
            completion: { [weak self] (result: Result<DateListResponse, Error>) in
                switch result {
                case .success(let response):
                    self?.dateListView?.update(with: response.results)
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }

                self?.dateListView?.set(loading: false)
            }
        )
    }
}

extension DateListViewController: DateListViewDelegate {
    func didSelect(date: DateDetails) {
        let dateDetailsModule = wireframe.buildDateDetailsModule(dateDetails: date)
        navigationController?.pushViewController(dateDetailsModule, animated: true)
    }
}
