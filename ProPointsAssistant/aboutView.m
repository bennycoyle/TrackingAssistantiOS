//
//  aboutView.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 08/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "aboutView.h"
#import "commonFunctions.h"

@interface aboutView ()


@end

@implementation aboutView {
    commonFunctions *cf;
}



@synthesize aboutScrollView = _aboutScrollView;
@synthesize aboutContentView = _aboutContentView;

 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization

 }
 return self;
 }
 
 
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    cf = [[commonFunctions alloc]init];
    [cf setupColor:self.navigationController.navigationBar myView:self.view];
    
    
    CGFloat height = (CGFloat)_aboutContentView.frame.size.height;
    CGFloat width = (CGFloat)_aboutContentView.frame.size.width;
    int h = (int)_aboutContentView.frame.size.height;
    int w = (int)_aboutContentView.frame.size.width;
    [_aboutScrollView setScrollEnabled:YES];
    [_aboutScrollView setContentSize:CGSizeMake(320,1500)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)launchSoloFacebook:(id)sender {
    NSURL *appUrl = [NSURL URLWithString:@"fb://profile/592183144144809"];
    NSURL *webUrl = [NSURL URLWithString:@"http://www.facebook.com/brendancoylemusic"];
    if ([[UIApplication sharedApplication] canOpenURL:appUrl]){
        [[UIApplication sharedApplication] openURL:appUrl];
    }
    else {
        [[UIApplication sharedApplication] openURL:webUrl];
    }
}

- (IBAction)launchSoloGooglePlus:(id)sender {
    NSURL *appUrl = [NSURL URLWithString:@"gplus://plus.google.com/+BrendanCoyleMusic"];
    NSURL *webUrl = [NSURL URLWithString:@"http://plus.google.com/+BrendanCoyleMusic"];
    if ([[UIApplication sharedApplication] canOpenURL:appUrl]){
        [[UIApplication sharedApplication] openURL:appUrl];
    }
    else {
        [[UIApplication sharedApplication] openURL:webUrl];
    }
}

- (IBAction)launchSoloSoundcloud:(id)sender {
    NSURL *appUrl = [NSURL URLWithString:@"soundcloud:user:bennycoyle"];
    NSURL *webUrl = [NSURL URLWithString:@"http://www.soundcloud.com/bennycoyle"];
    if ([[UIApplication sharedApplication] canOpenURL:webUrl]){
        [[UIApplication sharedApplication] openURL:webUrl];
    }
    else {
        [[UIApplication sharedApplication] openURL:webUrl];
    }
}

- (IBAction)launchSoloTwitter:(id)sender {
    NSURL *appUrl = [NSURL URLWithString:@"twitter://user?screen_name=bennycoyle"];
    NSURL *webUrl = [NSURL URLWithString:@"http://www.twitter.com/bennycoyle"];
    if ([[UIApplication sharedApplication] canOpenURL:appUrl]){
        [[UIApplication sharedApplication] openURL:appUrl];
    }
    else {
        [[UIApplication sharedApplication] openURL:webUrl];
    }
}

- (IBAction)launchSoloYoutube:(id)sender {
    NSURL *appUrl = [NSURL URLWithString:@"youtube://user/brendanmjcoyle"];
    NSURL *webUrl = [NSURL URLWithString:@"http://www.youtube.com/user/brendanmjcoyle"];
    if ([[UIApplication sharedApplication] canOpenURL:appUrl]){
        [[UIApplication sharedApplication] openURL:appUrl];
    }
    else {
        [[UIApplication sharedApplication] openURL:webUrl];
    }
}

- (IBAction)launchChangePlan:(id)sender{
    NSURL *webUrl = [NSURL URLWithString:@"http://brendancoyle.ie/2016/01/tracking-assistant-updates/"];
    [[UIApplication sharedApplication] openURL:webUrl];
}

- (IBAction)launchHowTo:(id)sender{
    NSURL *webUrl = [NSURL URLWithString:@"http://brendancoyle.ie/2016/01/trackingassistant-sp-how-to/"];
    [[UIApplication sharedApplication] openURL:webUrl];
}
@end
