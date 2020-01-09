//
//  YJView.m
//  YJView
//
//  Created by apple on 2019/12/27.
//  Copyright © 2019 Alen. All rights reserved.
//

#import "YJShowView.h"
#import "NSString+Cookie.h" // convert NSString to NSHttpCookie

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define Y_HANDLER_NAME @"y_updateCookies"
@interface YJShowView()

@end

@implementation YJShowView

- (instancetype)initWithNothing {
    if ([self init]) {
        WKWebViewConfiguration *webConfig = [[WKWebViewConfiguration alloc] init];
        WKUserContentController *userContentController = [[WKUserContentController alloc] init];
        NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);$('meta[name=description]').remove(); $('head').append( '<meta name=\"viewport\" content=\"width=device-width, initial-scale=1,user-scalable=no\">' );";
        WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        [userContentController addUserScript:wkUScript];
        
        NSMutableString *javascript = [NSMutableString string];
        [javascript appendString:@"document.documentElement.style.webkitTouchCallout='none';"];//禁止长按
        [javascript appendString:@"document.documentElement.style.webkitUserSelect='none';"];//禁止选择
        WKUserScript *noneSelectScript = [[WKUserScript alloc] initWithSource:javascript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        [userContentController addUserScript:noneSelectScript];
        webConfig.userContentController = userContentController;
        webConfig.preferences.javaScriptEnabled = YES;
        webConfig.preferences.javaScriptCanOpenWindowsAutomatically = NO;
        webConfig.allowsInlineMediaPlayback = YES;
        // 初始化偏好设置属性：preferences
        webConfig.preferences = [WKPreferences new];
        // The minimum font size in points default is 0;
        webConfig.preferences.minimumFontSize = 10;
        [webConfig.preferences setValue:@YES forKey:@"allowFileAccessFromFileURLs"];//支持跨域
        self = [[YJShowView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) configuration:webConfig];
        self.multipleTouchEnabled = YES;
        self.autoresizesSubviews = YES;
    }
    return self;
}

- (void)loadSomething:(NSString *)fileName {
    NSString *filePath;
    filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"html"];
    if (!filePath) {
        filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"htm"];
    }
    NSURL * url = [[NSURL alloc] initFileURLWithPath:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    if (@available(iOS 9.0, *)) {
        [self loadFileURL:request.URL allowingReadAccessToURL:request.URL.URLByDeletingLastPathComponent];
    } else {
        [self loadRequest:request];
    }
}
@end
