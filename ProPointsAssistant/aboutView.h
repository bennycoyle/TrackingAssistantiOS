//
//  aboutView.h
//  TrackingAssistant
//
//  Created by Brendan Coyle on 08/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface aboutView : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *aboutScrollView;
@property (weak, nonatomic) IBOutlet UIView *aboutContentView;

- (IBAction)launchSoloFacebook:(id)sender;
- (IBAction)launchSoloGooglePlus:(id)sender;
- (IBAction)launchSoloSoundcloud:(id)sender;
- (IBAction)launchSoloTwitter:(id)sender;
- (IBAction)launchSoloYoutube:(id)sender;
- (IBAction)launchChangePlan:(id)sender;
- (IBAction)launchHowTo:(id)sender;

@end
