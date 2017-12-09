/* This Source Code Form is subject to the terms of the Mozilla Public
* License, v. 2.0. If a copy of the MPL was not distributed with this
* file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import AutocompleteTextField

class DomainCompletionSource: AutocompleteTextFieldCompletionSource {
	private var topDomains: [String] = {
		let filePath = Bundle.main.path(forResource: "topdomains", ofType: "txt")
		return try! String(contentsOfFile: filePath!).components(separatedBy: "\n")
	}()
	
	func autocompleteTextFieldCompletionSource(_ autocompleteTextField: AutocompleteTextField, forText text: String) -> String? {
		guard !text.isEmpty else { return nil }
		
		for domain in self.topDomains where self.completion(forDomain: domain, withText: text) != nil {
			return self.completion(forDomain: domain, withText: text)!
		}
		
		return nil
	}
	private func completion(forDomain domain: String, withText text: String) -> String? {
		let domainWithDotPrefix: String = ".www.\(domain)"
		guard let range = domainWithDotPrefix.range(of: ".\(text)", options: .caseInsensitive, range: nil, locale: nil) else { return nil }
		
		// We don't actually want to match the top-level domain ("com", "org", etc.) by itself, so
		// so make sure the result includes at least one ".".
		let startIndex = domainWithDotPrefix.index(range.lowerBound, offsetBy: 1)
		let matchedDomain = domainWithDotPrefix[startIndex..<domainWithDotPrefix.endIndex]
		if matchedDomain.contains(".") {
			return matchedDomain.hasSuffix("/") ? String(matchedDomain) : matchedDomain + "/"
		}
		
		return nil
	}
}
