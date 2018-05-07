//
//  WebView.m
//  ACOM
//
//  Created by Clue Corp on 23/04/18.
//
//

#import "WebViewController.h"

#import "AppDelegate.h"

@interface WebViewController () <UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *backBarButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *forwardBarButton;

@end

@implementation WebViewController
@synthesize urlString;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.backBarButton setEnabled:NO];
    [self.forwardBarButton setEnabled:NO];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [_activityIndicator startAnimating];
    
    if ([self.webView canGoForward]) {
        [self.forwardBarButton setEnabled:YES];
        [self.forwardBarButton setTintColor:[UIColor whiteColor]];
        
    } else {
        [self.forwardBarButton setEnabled:NO];
        [self.forwardBarButton setTintColor:UIColorFromRGB(0xFE9743)];
    }
    
    if ([self.webView canGoBack]) {
        [self.backBarButton setEnabled:YES];
        [self.backBarButton setTintColor:[UIColor whiteColor]];
        
    } else {
        [self.backBarButton setEnabled:NO];
        [self.backBarButton setTintColor:UIColorFromRGB(0xFE9743)];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_activityIndicator stopAnimating];
    
    if ([self.webView canGoForward]) {
        [self.forwardBarButton setEnabled:YES];
        [self.forwardBarButton setTintColor:[UIColor whiteColor]];
        
    } else {
        [self.forwardBarButton setEnabled:NO];
        [self.forwardBarButton setTintColor:UIColorFromRGB(0xFE9743)];
    }
    
    if ([self.webView canGoBack]) {
        [self.backBarButton setEnabled:YES];
        [self.backBarButton setTintColor:[UIColor whiteColor]];
        
    } else {
        [self.backBarButton setEnabled:NO];
        [self.backBarButton setTintColor:UIColorFromRGB(0xFE9743)];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backButton:(id)sender {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
}

- (IBAction)forwardButton:(id)sender {
    if ([self.webView canGoForward]) {
        [self.webView goForward];
    }}

@end
