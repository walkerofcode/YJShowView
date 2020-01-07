//
//  YJViewController.m
//  YJShowView
//
//  Created by 344403905@qq.com on 01/07/2020.
//  Copyright (c) 2020 344403905@qq.com. All rights reserved.
//

#import "YJViewController.h"
#import "YJView.h"

@interface YJViewController ()

@end

@implementation YJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    YJView* yjView = [[YJView alloc] initWithNothing];
//    NSURL* url = [NSURL URLWithString:@"https://www.baidu.com"];
//    NSURLRequest* request = [NSURLRequest requestWithURL:url];
//    [yjView loadRequest:request];
    if (@available(iOS 11.0, *)) {
        yjView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    yjView.scrollView.scrollEnabled = NO;
    [self.view addSubview:yjView];
    [yjView loadSomething:@"index"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
