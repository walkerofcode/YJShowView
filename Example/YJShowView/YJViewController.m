//
//  YJViewController.m
//  YJShowView
//
//  Created by lixiangnanshou@163.com on 01/09/2020.
//  Copyright (c) 2020 lixiangnanshou@163.com. All rights reserved.
//

#import "YJViewController.h"
#import <YJShowView/YJShowView.h>

@interface YJViewController ()

@end

@implementation YJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    YJShowView *webView = [[YJShowView alloc] initWithNothing];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
