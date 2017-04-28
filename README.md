# AutocompleteTextField
An iOS text field that autocompletes text with the supplied list of words.

## Usage
```swift
import AutocompleteTextField

// First implement the completion source:
extension ViewController: AutocompleteTextFieldCompletionSource {
    func autocompleteTextFieldCompletionSource(_ autocompleteTextField: AutocompleteTextField, forText text: String) -> String? {
        guard !text.isEmpty else { return nil }
        return domains.first { $0.hasPrefix(text) }
    }
}

class ViewController: UIViewController {
    let domains = ["mozilla.org", "google.com", "wikipedia.org"]

    override func viewDidLoad() {
        // Then create an AutocompleteTextField, attaching our source:
        let textField = AutocompleteTextField()
        textField.completionSource = self
        view.addSubview(textField)
        ...
    }
}
```

To see this in action, run the example project!
