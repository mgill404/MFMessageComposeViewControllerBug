//
//  ModalViewController.m
//  MFMessageBug
//
//  Created by Mark Gill on 3/31/16.
//  Copyright © 2016 edify. All rights reserved.
//

#import "ModalViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ModalViewController ()

@end

@implementation ModalViewController

- (instancetype)init
{
    self = [super init];
    
    self.modalPresentationStyle = UIModalPresentationFormSheet;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(400, 400, 100, 100)];
    [button setTitle:@"Show Message" forState:UIControlStateNormal];    
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.view.superview.bounds = CGRectMake(0,0,700,700);
    [self.view.superview.layer setCornerRadius:25];
}

- (void)buttonPressed
{
    [self showMessage];
}

- (void)showMessage
{
    MFMessageComposeViewController *messageViewController = [[MFMessageComposeViewController alloc] init];
    messageViewController.messageComposeDelegate = self;
    messageViewController.body = @"adding some text";
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"accordion_a1" withExtension:@"m4a"];
    NSString *audioType = (NSString *)kUTTypeAudio;
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    
    [messageViewController addAttachmentData:data
                              typeIdentifier:audioType
                                    filename:@"accordion.m4a"];
    
    [self presentViewController:messageViewController animated:YES completion:nil];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller
                 didFinishWithResult:(MessageComposeResult)result
{
    [controller dismissViewControllerAnimated:YES completion:^{
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

@end
