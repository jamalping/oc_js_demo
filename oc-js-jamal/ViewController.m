//
//  ViewController.m
//  oc-js-jamal
//
//  Created by jamalping on 15/10/22.
//  Copyright © 2015年 cisc. All rights reserved.
//

#import "ViewController.h"
#import "SecondeViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

/*
 js 交互学习地址
 http://www.2cto.com/kf/201503/383795.html
 http://www.webryan.net/2013/10/about-ios7-javascriptcore-framework/
 */
@interface ViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *baseURL = [NSURL URLWithString:@"http://10.137.30.115:8080/genius_api/static/test.html"];
//    NSURL *baseURL = [NSURL URLWithString:@"http://121.15.137.181:8080/m/invest/index.html#!/dynamic/contest/index.html"];
    [_webView loadRequest:[NSURLRequest requestWithURL:baseURL]];
    
    
}
- (IBAction)buttonClick:(id)sender {
    SecondeViewController *secondeViewC = [[SecondeViewController alloc] init];
    UINavigationController *navg = [[UINavigationController alloc] initWithRootViewController:secondeViewC];
    [self presentViewController:navg animated:YES completion:nil];
}

#pragma mark ---UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"webViewDidFinishLoad= %@",webView.request.URL.scheme);
    // 获取该UIWebview的javascript执行环境。
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    // 这个函数的执行体完全是 objective-c代码写的，也就是下面： ocFun 的调用在前断，这里只是实现
    context[@"ocFun"] = ^(NSString *url) {
        NSLog(@"+++++++Begin Log+++++++");
        NSArray *args = [JSContext currentArguments];
        
        for (JSValue *jsVal in args) {
            NSLog(@"%@", jsVal);
        }
        
        JSValue *this = [JSContext currentThis];
        NSArray *ary = [JSContext currentArguments];
        NSLog(@"this: %@...ary = %@",this,ary);
        NSLog(@"-------End Log-------");
    };
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    
}

@end
