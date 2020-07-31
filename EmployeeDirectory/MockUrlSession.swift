//
//  MockUrlSession.swift
//  EmployeeDirectory
//
//  Created by Kaival shah on 2020-07-30.
//  Copyright © 2020 Nency Kanani. All rights reserved.
//

import Foundation
class MockURLSession: URLSession {
  var url: URL?
  
  override func dataTask(with url: URL, completionHandler:      @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    self.url = url
    return URLSession.shared.dataTask(with: url)
  }
}
