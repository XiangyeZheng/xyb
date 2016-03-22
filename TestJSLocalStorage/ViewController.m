//
//  ViewController.m
//  TestJSLocalStorage
//
//  Created by xy006 on 16/3/18.
//  Copyright © 2016年 XY. All rights reserved.
//

#import "ViewController.h"
#define _windowWidth        [ UIScreen mainScreen ].applicationFrame.size.width
// 手机屏幕的高度
#define _windowHeight       [ UIScreen mainScreen ].applicationFrame.size.height
@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController{
    UITextField *_tfUrl;
    UIButton *_btnGo;
    UIWebView *_webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.941 green:0.941 blue:0.941 alpha:1];
    // Do any additional setup after loading the view, typically from a nib.
    //    [UIApplication sharedApplication].k;
    
    [self createTextField];
    [self createWebView];
    
    
}
- (void)createTextField{
    _tfUrl = [[UITextField alloc] initWithFrame:CGRectMake(15, 20, _windowWidth - 30, 40)];
    _tfUrl.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    _tfUrl.leftViewMode = UITextFieldViewModeAlways;
    _tfUrl.layer.borderColor = [UIColor redColor].CGColor;
    _tfUrl.layer.masksToBounds = YES;
    _tfUrl.layer.cornerRadius = 2;
    _tfUrl.layer.borderWidth = 0.5;
    _tfUrl.font = [UIFont systemFontOfSize:15];
    _tfUrl.text = @"http://m.jd.com/";
    _tfUrl.placeholder = @"路径";
    
    _btnGo = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 50, 30)];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    [v addSubview:_btnGo];
    [_btnGo setTitle:@"Go" forState:UIControlStateNormal];
    _btnGo.backgroundColor = [UIColor cyanColor];
    [_btnGo setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _tfUrl.rightView = v;
    [_btnGo addTarget:self action:@selector(goClick) forControlEvents:UIControlEventTouchUpInside];
    _btnGo.titleLabel.font = [UIFont systemFontOfSize:15];
    _tfUrl.rightViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:_tfUrl];
}
- (void)createWebView{
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(15, 66, _windowWidth-30, _windowHeight - 66)];
    _webView.delegate = self;
    _webView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_webView];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_tfUrl.text]]];
}
#pragma mark - go事件
- (void)goClick{
    if (![_tfUrl.text isEqualToString:@""]) {
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_tfUrl.text]]];
        
    }
}
#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
