//
//  YoutubePlayerViewController.swift
//  Dismo 2
//
//  Created by Jehnsen Hirena Kane on 14/04/23.
//

import UIKit
import WebKit

public class YoutubePlayerViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    let videoId: String
    
    public init(videoId: String)  {
        self.videoId = videoId
        super.init(nibName: "YoutubePlayerViewController", bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        loadYoutubeVideo()
    }

    private func loadYoutubeVideo() {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoId)") else {
            self.popupAlert(title: "Error",
                            message: "Wrong video url, please try again later")
            return
        }
        webView.load(URLRequest(url: url))
    }
}
