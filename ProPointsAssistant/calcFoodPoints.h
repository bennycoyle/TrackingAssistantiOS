//
//  calcFoodPoints.h
//  TrackingAssistant
//
//  Created by Brendan Coyle on 13/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface calcFoodPoints : UIViewController <UITextFieldDelegate> {
    UIToolbar * closeKeyboardButton;
}
@property (weak, nonatomic) IBOutlet UITextField *proteinField;
@property (weak, nonatomic) IBOutlet UITextField *carbsField;
@property (weak, nonatomic) IBOutlet UITextField *fatField;
@property (weak, nonatomic) IBOutlet UITextField *fibreField;
@property (weak, nonatomic) IBOutlet UITextField *servingField;
@property (weak, nonatomic) IBOutlet UILabel *foodCalcHeadingLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodPointsHeadingLabel;
@property (weak, nonatomic) IBOutlet UILabel *foodPointsLabel;
@property (strong, nonatomic) IBOutlet UIView *calcFoodPointsView;

@property (nonatomic, retain) UIToolbar *closeKeyboardButton;
- (IBAction)calcFoodPoints:(id)sender;

- (void) closeKeyboard:(id) sender;

@end
