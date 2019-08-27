//
//  GTDetailViewController.m
//  SampleApp
//
//  Created by dianyi on 2019/8/16.
//  Copyright © 2019 dianyi. All rights reserved.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>
#import "GTScreen.h"
#import "GTMediator.h"
#import "GTLogin.h"

@interface GTDetailViewController () <WKNavigationDelegate>
@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, strong, readwrite) UIProgressView *progressView;
@property (nonatomic, copy, readwrite) NSString *articleUrl;
@end

@implementation GTDetailViewController

+ (void)load
{
//    [GTMediator registerScheme:@"detail://" processBlock:^(NSDictionary *params) {
//        NSString *url = [params objectForKey:@"url"];
//        UINavigationController *navigationController = (UINavigationController *)[params objectForKey:@"controller"];
//        GTDetailViewController *controller = [[GTDetailViewController alloc] initWithUrlString:url];
//        [navigationController pushViewController:controller animated:YES];
//    }];
    
    [GTMediator registerProtocol:@protocol(GTDetailViewControllerProtocol) class:[self class]];
}

- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (instancetype)initWithUrlString:(NSString *)urlString
{
    self = [super init];
    if (self) {
        self.articleUrl = urlString;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(_shareArticle)];
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, STATUSBARHEIGHT + 44, self.view.frame.size.width, self.view.frame.size.height - STATUSBARHEIGHT - 44)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];

    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, STATUSBARHEIGHT + 44, self.view.frame.size.width, 20)];
        self.progressView;
    })];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.progressView.progress = self.webView.estimatedProgress;
}

- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl
{
    return [[[self class] alloc] initWithUrlString:detailUrl];
}

- (void)_shareArticle
{
    [[GTLogin sharedLogin] shareToQQWithArticleUrl:[NSURL URLWithString:self.articleUrl]];
}

@end
