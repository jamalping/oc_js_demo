//
//  SecondeViewController.m
//  oc-js-jamal
//
//  Created by jamalping on 15/10/22.
//  Copyright © 2015年 cisc. All rights reserved.
//

#import "SecondeViewController.h"

@interface SecondeViewController () <UIWebViewDelegate>

@end

@implementation SecondeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.delegate = self;
    [self.view addSubview:webView];
//    NSURL *baseURL = [NSURL URLWithString:@"http://10.137.30.115:8080/genius_api/static/test.html"];
    NSURL *baseURL = [NSURL URLWithString:@"http://121.15.137.181:8080/m/invest/index.html#!/dynamic/contest/index.html"];
    [webView loadRequest:[NSURLRequest requestWithURL:baseURL]];
}

#pragma mark ---UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"%@--%@",request.URL.resourceSpecifier,request.URL.absoluteString);
    
    if ([request.URL.absoluteString containsString:@"redirectUrl="]) {
        NSLog(@"在这里检测跳转的地址是否包含约定的标志，有的话执行相应的操作");
        // to do
        return NO;
    }else {
        return YES;
    }
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"webViewDidFinishLoad= %@",webView.request.URL.scheme);
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    
}
@end
