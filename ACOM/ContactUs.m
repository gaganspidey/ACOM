//
//  ContactUs.m
//  ACOM
//
//  Created by Clue Corp on 23/04/18.
//
//

#import "ContactUs.h"

#define kEmailURL @"mailto:info@acom.pk?subject=title&body=content"

@interface ContactUs ()

@end

@implementation ContactUs

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)phoneNumberOne:(id)sender {
    NSString *phoneNumber = [@"tel:" stringByAppendingString:@"+923041116664"];
    
    if ([UIApplication.sharedApplication canOpenURL:[NSURL URLWithString:phoneNumber]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]
                                           options:@{}
                                 completionHandler:nil];
    }
}

- (IBAction)phoneNumberTwo:(id)sender {
    NSString *phoneNumber = [@"tel:" stringByAppendingString:@"+923009478023"];
    
    if ([UIApplication.sharedApplication canOpenURL:[NSURL URLWithString:phoneNumber]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]
                                           options:@{}
                                 completionHandler:nil];
    }
}

- (IBAction)openEmail:(id)sender {
    NSString *url = [kEmailURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
    if ([UIApplication.sharedApplication canOpenURL:[NSURL URLWithString:url]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]
                                           options:@{}
                                 completionHandler:nil];
    }
}



@end
