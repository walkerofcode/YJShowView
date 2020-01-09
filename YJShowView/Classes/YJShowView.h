//
//  YJView.h
//  YJView
//
//  Created by apple on 2019/12/27.
//  Copyright © 2019 Alen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import <YWebView/NSString+Cookie.h>
#import <YWebView/YWebView.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJShowView : YWebView

- (instancetype)initWithNothing;
- (void)loadSomething:(NSString *)fileName;
@end

NS_ASSUME_NONNULL_END
