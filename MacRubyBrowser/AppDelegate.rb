#
#  AppDelegate.rb
#  MacRubyBrowser
#
#  Created by Brian Sam-Bodden on 4/4/11.
#  Copyright 2011 Integrallis Software. All rights reserved.
#

class AppDelegate
    attr_accessor :window
    attr_accessor :web_view
    attr_accessor :url_bar
    attr_accessor :back_button
    attr_accessor :forward_button
    
    def applicationDidFinishLaunching(a_notification)
        NSLog "We are ready to Rock and Roll!"
        go_home self
    end
    
    def	go_back(sender)
        NSLog "in go_back"
        @web_view.goBack
    end
    
    def go_forward(sender)
        NSLog "going forward"
        @web_view.goForward
    end
    
    def go_home(sender)
        NSLog "in go_home"
        @url_bar.setStringValue "http://www.google.com"
        load_page sender
    end
    
    def load_page(sender)
        NSLog "We are going to => #{@url_bar.stringValue}"
		@web_view.mainFrame.loadRequest(NSURLRequest.requestWithURL(NSURL.URLWithString(@url_bar.stringValue)))  
    end
    
    def webView(webView, didStartProvisionalLoadForFrame:frame)
        NSLog "In didStartProvisionalLoadForFrame!!!"
        if (frame == @web_view.mainFrame)
            @url_bar.setStringValue frame.provisionalDataSource.request.URL.absoluteString
        end
    end
    
    def webView(webView, didReceiveTitle:title, forFrame:frame)
        NSLog "In didReceiveTitle ==> #{title}"
        if (frame == @web_view.mainFrame)
            @web_view.window.title = title
        end
    end
    
end



