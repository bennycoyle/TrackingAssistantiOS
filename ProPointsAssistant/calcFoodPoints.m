//
//  calcFoodPoints.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 13/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "calcFoodPoints.h"
#import "commonFunctions.h"

@interface calcFoodPoints ()

@end

@implementation calcFoodPoints {
    #define IDIOM    UI_USER_INTERFACE_IDIOM()
    #define IPAD     UIUserInterfaceIdiomPad

    double dProtein, dCarbs, dFat, dFibre, dServings;
    double pointsUnrounded;
    int pointsRounded;
    commonFunctions *cf;
}

@synthesize proteinField = _proteinField;
@synthesize carbsField = _carbsField;
@synthesize fatField = _fatField;
@synthesize fibreField = _fibreField;
@synthesize servingField = _servingField;
@synthesize foodCalcHeadingLabel = _foodCalcHeadingLabel;
@synthesize foodPointsHeadingLabel = _foodPointsHeadingLabel;
@synthesize foodPointsLabel = _foodPointsLabel;
@synthesize calcFoodPointsView = _calcFoodPointsView;
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
    _proteinField.inputAccessoryView = closeKeyboardButton;
    _carbsField.inputAccessoryView = closeKeyboardButton;
    _fatField.inputAccessoryView = closeKeyboardButton;
    _fibreField.inputAccessoryView = closeKeyboardButton;
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
        if ( textField == self.fatField) {
            [cf moveView:textField up:YES :30 :self.view];
        } else if (textField == self.fibreField) {
            [cf moveView:textField up:YES :60 :self.view ];
        } else if ( textField == self.servingField ) {
            [cf moveView:textField up:YES :120 :self.view ];
        }
    }
}

//When done editing, move the view down
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ( IDIOM != IPAD ) {
        if ( textField == self.fatField) {
            [cf moveView:textField up:NO :30 :self.view];
        } else if (textField == self.fibreField) {
            [cf moveView:textField up:NO :60 :self.view ];
        } else if ( textField == self.servingField ) {
            [cf moveView:textField up:NO :120 :self.view ];
        }
    }
}

//Keyboard Stuff
- (void) closeKeyboard:(id)sender {
    if ([_proteinField isFirstResponder])
        [_proteinField resignFirstResponder];

    if ([_carbsField isFirstResponder])
        [_carbsField resignFirstResponder];

    if ([_fatField isFirstResponder])
        [_fatField resignFirstResponder];

    if ([_fibreField isFirstResponder])
        [_fibreField resignFirstResponder];

    if ([_servingField isFirstResponder])
        [_servingField resignFirstResponder];
}

- (IBAction)calcFoodPoints:(id)sender {
    [self closeKeyboard:self];
    [self checkFieldValues];
}

- (void) checkFieldValues {
    [ cf clearPointsLabels:_foodPointsHeadingLabel points:_foodPointsLabel ];
    if ( [_proteinField.text length] == 0 || [_proteinField.text isEqualToString:@"."] ) {
        [cf notifyUsers:@"Protein" msg:@"Enter Protein Value"];
    } else {
        if ( [_carbsField.text length] == 0 || [_carbsField.text isEqualToString:@"."] ) {
            [cf notifyUsers:@"Carbohydrates" msg:@"Enter Carbs Value"];
        } else {
            if ( [_fatField.text length] == 0 || [_fatField.text isEqualToString:@"."] ) {
                [cf notifyUsers:@"Fat" msg:@"Enter Fat Value"];
            } else {
                if ( [_fibreField.text length] == 0 || [_fibreField.text isEqualToString:@"."] ) {
                    [cf notifyUsers:@"Fibre" msg:@"Enter Fibre Value"];
                } else {
                    dProtein = [_proteinField.text doubleValue];
                    dCarbs = [_carbsField.text doubleValue];
                    dFat = [_fatField.text doubleValue];
                    dFibre = [_fibreField.text doubleValue];
                    if ( [_servingField.text isEqualToString:@"."] ) {
                        [cf notifyUsers:@"Servings" msg:@"Incorrect Servings Value"];
                    } else {
                        dServings = [self getServingsValue];
                        NSLog(@"Protein = %f, Carbs = %f, Fat = %f, Fibre = %f, Servings = %f", dProtein, dCarbs, dFat, dFibre, dServings);
                        pointsUnrounded = [self calcPoints:dProtein b:dCarbs c:dFat d:dFibre e:dServings];
                        pointsRounded = [cf roundIt:pointsUnrounded];
                        NSLog(@"Rounded = %d", pointsRounded);
                        
                        NSString *pointsString = [NSString stringWithFormat:@"%d", pointsRounded];
                        [cf setPointsLabels:_foodPointsHeadingLabel points:_foodPointsLabel value:pointsString];
                    }
                }
            }
        }
    }
}
- (double) getServingsValue {
    double servingsReturn;
    if ( [_servingField.text length] == 0) {
        servingsReturn = 1.0;
    } else {
        servingsReturn = [_servingField.text doubleValue];
    }
    return servingsReturn;
}
- (double) calcPoints:(double)a b:(double)b c:(double)c d:(double)d e:(double)e{
    double pointsTemp = ( ( ( a / 10.9375 ) + ( b / 9.2105 ) + ( c / 3.8889 ) + ( d / 35 ) ) * e );
    return pointsTemp;
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
