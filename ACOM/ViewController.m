//
//  ViewController.m
//  ACOM
//
//  Created by Clue Corp on 23/04/18.
//
//

#import "ViewController.h"

#import "WebViewController.h"

@interface ViewController () <UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *searchBarHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *searchButtonHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *socialViewHeight;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UIButton *shoppingButton;
@property (strong, nonatomic) IBOutlet UIButton *aboutUsButton;
@property (strong, nonatomic) IBOutlet UIButton *contactUsButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.searchButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    self.shoppingButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    self.aboutUsButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    self.contactUsButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    self.socialViewHeight.constant = 0;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.6f
          initialSpringVelocity:1.f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.searchButton.hidden = NO;
                         self.searchButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
                     } completion:^(BOOL finished) {
                         self.searchButton.transform = CGAffineTransformIdentity;
                     }];
    
    //
    [UIView animateWithDuration:0.5
                          delay:0.2
         usingSpringWithDamping:0.6f
          initialSpringVelocity:1.f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.shoppingButton.hidden = NO;
                         self.shoppingButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
                     } completion:^(BOOL finished) {
                         self.shoppingButton.transform = CGAffineTransformIdentity;
                     }];
    
    //
    [UIView animateWithDuration:0.5
                          delay:0.4
         usingSpringWithDamping:0.6f
          initialSpringVelocity:1.f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.aboutUsButton.hidden = NO;
                         self.aboutUsButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
                     } completion:^(BOOL finished) {
                         self.aboutUsButton.transform = CGAffineTransformIdentity;
                     }];
    
    //
    [UIView animateWithDuration:0.5
                          delay:0.6
         usingSpringWithDamping:0.6f
          initialSpringVelocity:1.f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.contactUsButton.hidden = NO;
                         self.contactUsButton.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
                     } completion:^(BOOL finished) {
                         self.contactUsButton.transform = CGAffineTransformIdentity;
                     }];
    
    //
    self.socialViewHeight.constant = 44;
    
    [UIView animateWithDuration:0.4
                          delay:0.7
         usingSpringWithDamping:0.8
          initialSpringVelocity:20.0
                        options:0
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:NULL];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.searchBarHeight.constant = 0;
    self.searchButtonHeight.constant = 44;
    self.searchButton.hidden = NO;
    [self dismissKeypad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self cancelSearch];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (![[searchBar.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) {
        self.searchBarHeight.constant = 0;
        self.searchButtonHeight.constant = 44;
        self.searchButton.hidden = NO;
        [self dismissKeypad];
        
        WebViewController *objWebView = [[self storyboard] instantiateViewControllerWithIdentifier:@"webView"];
        objWebView.urlString = [NSString stringWithFormat:@"https://www.acom.pk/catalogsearch/result/?cat=0&q=%@", searchBar.text];
        [self.navigationController pushViewController:objWebView animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)cancelSearch {
    self.searchBarHeight.constant = 0;
    self.searchButtonHeight.constant = 44;
    self.searchButton.hidden = NO;
    
    [UIView animateWithDuration:0.4
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:20.0
                        options:0
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         [self dismissKeypad];
                     }];
}

- (void)dismissKeypad {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder)
                                               to:nil
                                             from:nil
                                         forEvent:nil];
}

- (IBAction)searchProducts:(id)sender {
    self.searchBarHeight.constant = 44;
    self.searchButtonHeight.constant = 0;
    self.searchButton.hidden = YES;
    
    [UIView animateWithDuration:0.4
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:20.0
                        options:0
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         [self.searchBar becomeFirstResponder];
                     }];
}

- (IBAction)shoppingPortal:(id)sender {
    static NSString *webURL = @"https://www.acom.pk/";
    
    WebViewController *objWebView = [[self storyboard] instantiateViewControllerWithIdentifier:@"webView"];
    objWebView.urlString = webURL;
    [self.navigationController pushViewController:objWebView animated:YES];
}

- (IBAction)twitter:(id)sender {
    [self openURL:@"https://twitter.com/acompkonline"];
}

- (IBAction)facebook:(id)sender {
    [self openURL:@"https://facebook.com/acom.pk"];
}

- (IBAction)google:(id)sender {
    [self openURL:@"https://plus.google.com/+Acompkonline"];
}

- (IBAction)pinterest:(id)sender {
    [self openURL:@"https://www.pinterest.com/acompkonline"];
}

- (void)openURL:(NSString *)url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]
                                       options:@{}
                             completionHandler:nil];
}

@end
