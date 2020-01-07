//
//  YJView.h
//  YJView
//
//  Created by apple on 2019/12/27.
//  Copyright © 2019 Alen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJView : WKWebView

- (instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration*)theConfiguration NS_DESIGNATED_INITIALIZER;
- (WKNavigation*)loadRequest:(NSURLRequest*)request;

// workaround http://stackoverflow.com/questions/31094110/memory-leak-when-using-wkscriptmessagehandler
// put the message handler name here, YWebView will remove them when dealloc
- (void)addScriptMessageHandlerNameForCleanup:(NSString*)name;

- (instancetype)initWithNothing;
- (void)loadSomething:(NSString *)fileName;
@end

NS_ASSUME_NONNULL_END
