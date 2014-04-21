//
//  calcDailyPoints.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 22/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "calcDailyPoints.h"
#import "commonFunctions.h"

@interface calcDailyPoints ()

@end

@implementation calcDailyPoints {
    #define IDIOM    UI_USER_INTERFACE_IDIOM()
    #define IPAD     UIUserInterfaceIdiomPad

    commonFunctions *cf;
    
    double dStones, dLbs, dAge, dFeet, dInches;
    double dKG, dCM;
    double pointsUnrounded;
    int pointsRounded;
    int iAge;
}
@synthesize genderSelector = _genderSelector;
@synthesize calcDailyPageHeading = _calcDailyPageHeading;
@synthesize dailyPointsHeadingLabel = _dailyPointsHeadingLabel;
@synthesize dailyPointsLabel = _dailyPointsLabel;
@synthesize dailyStonesField = _dailyStonesField;
@synthesize dailyLbsField = _dailyLbsField;
@synthesize dailyKgField = _dailyKgField;
@synthesize dailyAgeField = _dailyAgeField;
@synthesize dailyFeetField = _dailyFeetField;
@synthesize dailyInchesField = _dailyInchesField;
@synthesize dailyCmField = _dailyCmField;
@synthesize closeKeyboardButton = _closeKeyboardButton;


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

    
   
    if ( closeKeyboardButton == nil ) {
        //Create the Bar
        closeKeyboardButton = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 34)];
        
        //Create the Close Keyboard Button
        UIBarButtonItem *closeKButton = [[UIBarButtonItem alloc] initWithTitle:@"Close Keyboard"
                                                                         style:UIBarButtonItemStyleBordered
                                                                        target:self
                                                                        action:@selector(closeKeyboard:)];
        
        //Create Space Item to centre the button
        UIBarButtonItem *spaceOne = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                  target:self action:nil];
        //Add the items to the bar
        [closeKeyboardButton setItems:[[NSArray alloc] initWithObjects:spaceOne, closeKButton, spaceOne, nil]  ];
    }
    
    //Add it for each text field
    _dailyStonesField.inputAccessoryView = closeKeyboardButton;
    _dailyLbsField.inputAccessoryView = closeKeyboardButton;
    _dailyAgeField.inputAccessoryView = closeKeyboardButton;
    _dailyFeetField.inputAccessoryView = closeKeyboardButton;
    _dailyInchesField.inputAccessoryView = closeKeyboardButton;
    _dailyCmField.inputAccessoryView = closeKeyboardButton;
    _dailyKgField.inputAccessoryView = closeKeyboardButton;
}

- (void) closeKeyboard:(id)sender {
    if ([_dailyStonesField isFirstResponder])
        [_dailyStonesField resignFirstResponder];
    
    if ([_dailyLbsField isFirstResponder])
        [_dailyLbsField resignFirstResponder];
    
    if ([_dailyAgeField isFirstResponder])
        [_dailyAgeField resignFirstResponder];
    
    if ([_dailyFeetField isFirstResponder])
        [_dailyFeetField resignFirstResponder];
    
    if ([_dailyInchesField isFirstResponder])
        [_dailyInchesField resignFirstResponder];
    
    if ([_dailyKgField isFirstResponder])
        [_dailyKgField resignFirstResponder];
    
    
    if ([_dailyCmField isFirstResponder])
        [_dailyCmField resignFirstResponder];
}

//When editing, For fields that get covered by the keyboard, move the view up
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ( IDIOM != IPAD ) {
        if ( textField == self.dailyAgeField) {
            [cf moveView:textField up:YES :30 :self.view];
        } else if (textField == self.dailyFeetField) {
            [cf moveView:textField up:YES :60 :self.view ];
        } else if ( textField == self.dailyInchesField ) {
            [cf moveView:textField up:YES :60 :self.view ];
        } else if ( textField == self.dailyCmField) {
            [cf moveView:textField up:YES :40 :self.view ];
        }
    }
}

//When done editing, move the view down
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ( IDIOM != IPAD ) {
        if ( textField == self.dailyAgeField) {
            [cf moveView:textField up:NO :30 :self.view];
        } else if (textField == self.dailyFeetField) {
            [cf moveView:textField up:NO :60 :self.view ];
        } else if ( textField == self.dailyInchesField ) {
            [cf moveView:textField up:NO :60 :self.view ];
        } else if ( textField == self.dailyCmField) {
            [cf moveView:textField up:NO :40 :self.view ];
        }
    }
}

//Make sure that only Decimal numbers are entered
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *filtered;
    NSCharacterSet *validCharSet;
    NSString *decimal = @".";
    //Check if a decimal point has been entered yet
    BOOL decimalAlreadyEntered = [textField.text rangeOfString:decimal].location == NSNotFound ? NO : YES;
    //If not allow decimal in the character set
    //If there is (else) dont allow the decimal in the character set
    if (decimalAlreadyEntered == FALSE)
    {
        validCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890."] invertedSet];
        filtered = [[string componentsSeparatedByCharactersInSet:validCharSet] componentsJoinedByString:@""];
    } else {
        validCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        filtered = [[string componentsSeparatedByCharactersInSet:validCharSet] componentsJoinedByString:@""];
    }
    return [string isEqualToString:filtered];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calcImperialPoints:(id)sender {
    [self checkImperialValues];
}

- (void) checkImperialValues {

    [ cf clearPointsLabels:_dailyPointsHeadingLabel points:_dailyPointsLabel ];
    if ( [_dailyStonesField.text length] == 0 || [_dailyStonesField.text isEqualToString:@"."] ) {
        [cf notifyUsers:@"Stones" msg:@"Enter Stones Value"];
    } else {
        if ( [_dailyLbsField.text length] == 0 || [_dailyLbsField.text isEqualToString:@"."] ) {
            [cf notifyUsers:@"Pounds" msg:@"Enter Pounds Value"];
        } else {
            if ( [_dailyAgeField.text length] == 0 || [_dailyAgeField.text isEqualToString:@"."] ) {
                [cf notifyUsers:@"Age" msg:@"Enter Age Value"];
            } else {
                if ( [_dailyFeetField.text length] == 0 || [_dailyFeetField.text isEqualToString:@"."] ) {
                    [cf notifyUsers:@"Feet" msg:@"Enter Feet Value"];
                }else {
                    if ( [_dailyInchesField.text length] == 0 || [_dailyInchesField.text isEqualToString:@"."] ) {
                        [cf notifyUsers:@"Inches" msg:@"Enter Inches Value"];
                    } else {
                        dStones = [_dailyStonesField.text doubleValue];
                        dLbs = [_dailyLbsField.text doubleValue];
                        dAge = [_dailyAgeField.text doubleValue];
                        dFeet = [_dailyFeetField.text doubleValue];
                        dInches = [_dailyInchesField.text doubleValue];
                        
                        dKG = [cf stoneToKG:dStones lbs:dLbs];
                        dCM = ([cf feetToCM:dFeet inches:dInches] / 100 );
                        iAge = _genderSelector.selectedSegmentIndex;
                        
                        if (iAge == 0) {
                            pointsUnrounded = [self calcMalePoints:dKG b:dAge c:dCM];
                        } else {
                            pointsUnrounded = [self calcFemalePoints:dKG b:dAge c:dCM];
                        }
                        pointsRounded = [cf roundIt:pointsUnrounded];
                        
                        //Set Labels
                        NSString *pointsString = [NSString stringWithFormat:@"%d", pointsRounded];
                        [cf setPointsLabels:_dailyPointsHeadingLabel points:_dailyPointsLabel value:pointsString];
                    }
                }
            }
        }
    }
}

- (IBAction)calcMetricPoints:(id)sender {
    [self checkMetricValues];
}

- (void) checkMetricValues {
    [ cf clearPointsLabels:_dailyPointsHeadingLabel points:_dailyPointsLabel ];
    if ( [_dailyKgField.text length] == 0 || [_dailyKgField.text isEqualToString:@"."] ) {
        [cf notifyUsers:@"Kilograms" msg:@"Enter Kilogram Value"];
    } else {
        
        if ( [_dailyAgeField.text length] == 0 || [_dailyAgeField.text isEqualToString:@"."] ) {
            [cf notifyUsers:@"Age" msg:@"Enter Age Value"];
        } else {
                
            if ( [_dailyCmField.text length] == 0 || [_dailyCmField.text isEqualToString:@"."] ) {
                [cf notifyUsers:@"Centimetre" msg:@"Enter Centimetre Value"];
            } else {
                dAge = [_dailyAgeField.text doubleValue];
                dKG = [_dailyKgField.text doubleValue];
                dCM = ( [_dailyCmField.text doubleValue] / 100 );
                
                iAge = _genderSelector.selectedSegmentIndex;
                        
                if (iAge == 0) {
                    pointsUnrounded = [self calcMalePoints:dKG b:dAge c:dCM];
                } else {
                    pointsUnrounded = [self calcFemalePoints:dKG b:dAge c:dCM];
                }
                pointsRounded = [cf roundIt:pointsUnrounded];
                
                //Set Labels
                NSString *pointsString = [NSString stringWithFormat:@"%d", pointsRounded];
                [cf setPointsLabels:_dailyPointsHeadingLabel points:_dailyPointsLabel value:pointsString];
            }
        }
    }
}

- (double) calcMalePoints:(double) a b:(double)b c:(double)c {
    double ATEE = ( 0.9 * (864 - ( 9.72 * b ) + 1.12 * ( ( 14.2 * a ) + ( 503 * c ))) + 200 );
    double pointsTemp;
    pointsTemp = MAX(ATEE - 1000, 1000);
    pointsTemp = round((pointsTemp)/35);
    pointsTemp = MAX(pointsTemp - 7 - 4, 26);
    pointsTemp = MIN(pointsTemp, 71);

    return pointsTemp;
}

- (double) calcFemalePoints:(double) a b:(double)b c:(double)c {
    
    double ATEE = ( 0.9 * (387 - ( 7.31 * b ) + 1.14 * ( (10.9 * a) + (660.7 * c) )) + 200 );
    double pointsTemp;
    pointsTemp = MAX(ATEE - 1000, 1000);
    pointsTemp = round((pointsTemp)/35);
    pointsTemp = MAX(pointsTemp - 7 - 4, 26);
    pointsTemp = MIN(pointsTemp, 71);
    
    return pointsTemp;
}
@end
