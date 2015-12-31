//
//  calcSmartPoints.h
//  TrackingAssistant
//
//  Created by Brendan Coyle on 30/12/2015.
//  Copyright © 2015 Brendan Coyle. All rights reserved.
//

#import <UIkit/UIKit.h>

@interface calcSmartPoints : UIViewController <UITextFieldDelegate> {
    UIToolbar * closeKeyboardButton;
}

@property (weak, nonatomic) IBOutlet UITextField *caloriesField;
@property (weak, nonatomic) IBOutlet UITextField *satFatField;
@property (weak, nonatomic) IBOutlet UITextField *sugarsField;
@property (weak, nonatomic) IBOutlet UITextField *proteinField;
@property (weak, nonatomic) IBOutlet UITextField *valuePerField;
@property (weak, nonatomic) IBOutlet UITextField *servingField;
@property (weak, nonatomic) IBOutlet UILabel *smartCalcHeadingLabel;
@property (weak, nonatomic) IBOutlet UILabel *smartPointsHeadingLabel;
@property (weak, nonatomic) IBOutlet UILabel *smartPointsLabel;
@property (strong, nonatomic) IBOutlet UIView *calcSmartPointsView;

@property (nonatomic, retain) UIToolbar *closeKeyboardButton;
- (IBAction)calcSmartPoints:(id)sender;

- (void) closeKeyboard:(id) sender;

@end