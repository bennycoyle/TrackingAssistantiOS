//
//  calcSPExerLbs.h
//  TrackingAssistant
//
//  Created by Brendan Coyle on 20/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface calcSPExerPoints : UIViewController <UITextFieldDelegate> {
    UIToolbar * closeKeyboardButton;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *intensitySelector;
@property (weak, nonatomic) IBOutlet UITextField *stonesField;
@property (weak, nonatomic) IBOutlet UITextField *lbsField;
@property (weak, nonatomic) IBOutlet UITextField *timeField;
@property (weak, nonatomic) IBOutlet UILabel *exerPointsHeadingLabel;
@property (weak, nonatomic) IBOutlet UILabel *exerPointsLabel;
- (IBAction)calcSPExerLbs:(id)sender;
- (IBAction)calcSPExerKgs:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *kgsField;

@property (nonatomic, retain) UIToolbar *closeKeyboardButton;


@end
