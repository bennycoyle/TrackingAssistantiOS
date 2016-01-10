//
//  calcSmartPoints.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 30/12/2015.
//  Copyright © 2015 Brendan Coyle. All rights reserved.
//

#import "calcSmartPoints.h"
#import "commonFunctions.h"

@interface calcSmartPoints ()

@end

@implementation calcSmartPoints {

#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad
    
    double dCalories, dSatFat, dSugars, dProtein, dValuePer, dServings;
    double pointsUnrounded;
    int pointsRounded;
    commonFunctions *cf;
}

@synthesize caloriesField = _caloriesField;
@synthesize satFatField = _satFatField;
@synthesize sugarsField = _sugarsField;
@synthesize proteinField = _proteinField;
@synthesize valuePerField = _valuePerField;
@synthesize servingField = _servingField;
@synthesize smartCalcHeadingLabel = _smartCalcHeadingLabel;
@synthesize smartPointsHeadingLabel = _smartPointsHeadingLabel;
@synthesize smartPointsLabel = _smartPointsLabel;
@synthesize calcSmartPointsView = _calcSmartPointsView;
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
    _caloriesField.inputAccessoryView = closeKeyboardButton;
    _satFatField.inputAccessoryView = closeKeyboardButton;
    _sugarsField.inputAccessoryView = closeKeyboardButton;
    _proteinField.inputAccessoryView = closeKeyboardButton;
    _valuePerField.inputAccessoryView = closeKeyboardButton;
    _servingField.inputAccessoryView = closeKeyboardButton;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//When editing, For fields that get covered by the keyboard, move the view up
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ( IDIOM != IPAD ) {
        if ( textField == self.sugarsField) {
            [cf moveView:textField up:YES :30 :self.view];
        } else if (textField == self.proteinField) {
            [cf moveView:textField up:YES :60 :self.view ];
        } else if ( textField == self.valuePerField ) {
            [cf moveView:textField up:YES :120 :self.view ];
        } else if ( textField == self.servingField ) {
            [cf moveView:textField up:YES :150 :self.view];
        }
    }
}

//When done editing, move the view down
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ( IDIOM != IPAD ) {
        if ( textField == self.sugarsField) {
            [cf moveView:textField up:NO :30 :self.view];
        } else if (textField == self.proteinField) {
            [cf moveView:textField up:NO :60 :self.view ];
        } else if ( textField == self.valuePerField ) {
            [cf moveView:textField up:NO :120 :self.view ];
        } else if ( textField == self.servingField ) {
            [cf moveView:textField up:NO :150 :self.view ];
        }
    }
}

//Keyboard Stuff
- (void) closeKeyboard:(id)sender {
    if ([_caloriesField isFirstResponder])
        [_caloriesField resignFirstResponder];
    
    if ([_satFatField isFirstResponder])
        [_satFatField resignFirstResponder];
    
    if ([_sugarsField isFirstResponder])
        [_sugarsField resignFirstResponder];
    
    if ([_proteinField isFirstResponder])
        [_proteinField resignFirstResponder];
    
    if ([_valuePerField isFirstResponder])
        [_valuePerField resignFirstResponder];
    
    if ([_servingField isFirstResponder])
        [_servingField resignFirstResponder];
}

- (IBAction)calcSmartPoints:(id)sender {
    [self closeKeyboard:self];
    [self checkFieldValues];
}

- (void) checkFieldValues {
    [ cf clearPointsLabels:_smartPointsHeadingLabel points:_smartPointsLabel ];
    if ( [_caloriesField.text length] == 0 || [_caloriesField.text isEqualToString:@"."] ) {
        [cf notifyUsers:@"Calories" msg:@"Enter Calories Value"];
    } else {
        if ( [_satFatField.text length] == 0 || [_satFatField.text isEqualToString:@"."] ) {
            [cf notifyUsers:@"Saturated Fats" msg:@"Enter Saturated Fats Value"];
        } else {
            if ( [_sugarsField.text length] == 0 || [_sugarsField.text isEqualToString:@"."] ) {
                [cf notifyUsers:@"Sugars" msg:@"Enter Sugars Value"];
            } else {
                if ( [_proteinField.text length] == 0 || [_proteinField.text isEqualToString:@"."] ) {
                    [cf notifyUsers:@"Protein" msg:@"Enter Protein Value"];
                } else {
                    dCalories = [_caloriesField.text doubleValue];
                    dSatFat = [_satFatField.text doubleValue];
                    dSugars = [_sugarsField.text doubleValue];
                    dProtein = [_proteinField.text doubleValue];
                    dValuePer = [self getValuePer];
                    dServings = [self getServings];
                    
                    if ( dValuePer > 0 && dServings > 0 ) {
                        pointsUnrounded = [self calcPoints:dCalories b:dSatFat c:dSugars d:dProtein e:dValuePer f:dServings];
                        pointsRounded = [cf roundIt:pointsUnrounded];
                        if ( pointsRounded < 0 ) {
                            pointsRounded = 0;
                        }
                        NSString *pointsString = [NSString stringWithFormat:@"%d", pointsRounded];
                        [cf setPointsLabels:_smartPointsHeadingLabel points:_smartPointsLabel value:pointsString];
                    } else if ( dValuePer == 0 || dServings == 0 ) {
                        [cf notifyUsers:@"Error" msg:@"'Value Per' and 'Servings' must not be 0."];
                    }
                }
            }
        }
    }
}

- (double) getValuePer {
    double valuePerReturn = -0.0099009900;
    if ( [_valuePerField.text length] == 0 || [_valuePerField.text isEqualToString:@"."] ) {
        if ( [_servingField.text length] == 0 || [_servingField.text isEqualToString:@"."]) {
            valuePerReturn = 100;
        } else {
            [cf notifyUsers:@"Error" msg:@"You must enter a 'Value Per' when using Servings."];
            valuePerReturn = -0.0099009900;
        }
    } else {
        valuePerReturn = [_valuePerField.text doubleValue];
    }
    return valuePerReturn;
}

- (double) getServings {
    double servingsReturn = -0.0099009900;
    if ( [_servingField.text length] == 0 || [_servingField.text isEqualToString:@"."] ) {
        if ( [_valuePerField.text length] == 0 || [_valuePerField.text isEqualToString:@"."]) {
            servingsReturn = 100;
        } else {
            [cf notifyUsers:@"Error" msg:@"You must enter a 'Value Per' when using Servings."];
            servingsReturn = -0.0099009900;
        }
    } else {
        servingsReturn = [_servingField.text doubleValue];
    }
    return servingsReturn;
}

- (double) calcPoints:(double)a b:(double)b c:(double)c d:(double)d e:(double)e f:(double)f{
    double pointsTemp = ( ( a + ( c * 4 ) + ( b * 9 ) - ( d * 3.2 ) ) / 33 );
    double pointsOneGram = pointsTemp / e;
    double pointsServing = pointsOneGram * f;
    return pointsServing;
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

@end