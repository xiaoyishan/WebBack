//
//  HtmlC.m
//  WebBack
//
//  Created by Sundear on 2017/5/2.
//  Copyright © 2017年 xiexin. All rights reserved.
//

#import "HtmlC.h"

@interface HtmlC ()<UIWebViewDelegate>

@end

@implementation HtmlC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    UIWebView *web=[UIWebView new];
    web.frame=self.view.frame;
    web.opaque = NO;
    web.backgroundColor = [UIColor whiteColor];
    web.delegate=self;
    [self.view addSubview:web];
    [web scalesPageToFit];

    [web loadRequest:[NSURLRequest requestWithURL:_HtmlUrl]];
    
}

//开始加载
- (BOOL)webView:(UIWebView *)awebView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString* scheme = [[request URL] scheme];
    if (navigationType==UIWebViewNavigationTypeLinkClicked) {
        if ([scheme isEqualToString:@"https"] || [scheme isEqualToString:@"http"]){
            if (![_HtmlUrl isEqual: request.URL]) {
                HtmlC *help = [[HtmlC alloc]init];
                help.HtmlUrl=[request URL];
                [self.navigationController pushViewController:help animated:YES];
                return NO;
            }
        }
    }
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *meta = [NSString stringWithFormat:@"document.getElementsByName(\"viewport\")[0].content = \"width=device-width, user-scalable=yes\""];
    [webView stringByEvaluatingJavaScriptFromString:meta];

    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end
