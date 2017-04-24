/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import UIKit
import AutocompleteTextField

class ViewController: UIViewController {
    let domainCompletionSource = DomainCompletionSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        let textField = AutocompleteTextField()
        textField.layer.borderColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1).cgColor
        textField.layer.borderWidth = 0.5
        textField.keyboardType = .webSearch
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.completionSource = domainCompletionSource
        textField.accessibilityLabel = "Domain"
        view.addSubview(textField)

        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
}
