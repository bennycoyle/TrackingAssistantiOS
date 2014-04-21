//
//  calcDailyPoints.h
//  TrackingAssistant
//
//  Created by Brendan Coyle on 22/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface calcDailyPoints : UIViewController <UITextFieldDelegate> {
    UIToolbar * closeKeyboardButton;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSelector;
@property (weak, nonatomic) IBOutlet UILabel *calcDailyPageHeading;
@property (weak, nonatomic) IBOutlet UILabel *dailyPointsHeadingLabel;
@property (weak, nonatomic) IBOutlet UILabel *dailyPointsLabel;
@property (weak, nonatomic) IBOutlet UITextField *dailyStonesField;
@property (weak, nonatomic) IBOutlet UITextField *dailyKgField;


@property (weak, nonatomic) IBOutlet UITextField *dailyAgeField;
@property (weak, nonatomic) IBOutlet UITextField *dailyFeetField;
@property (weak, nonatomic) IBOutlet UITextField *dailyInchesField;
@property (weak, nonatomic) IBOutlet UITextField *dailyCmField;

- (IBAction)calcImperialPoints:(id)sender;
- (IBAction)calcMetricPoints:(id)sender;
@property (nonatomic, retain) UIToolbar *closeKeyboardButton;
@property (weak, nonatomic) IBOutlet UITextField *dailyLbsField;


@end
