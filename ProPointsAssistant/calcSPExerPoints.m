//
//  calcSPExerPoints.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 20/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "calcSPExerPoints.h"
#import "commonFunctions.h"

@interface calcSPExerPoints ()

@end

@implementation calcSPExerPoints {
    commonFunctions *cf;
    int iIntensity;
    
    //Intensity Values
    double lowValue, medValue, highValue;
    
    double dTime, dStones, dLbs, dKG;
    double pointsUnrounded;
    int pointsRounded;
}
@synthesize intensitySelector = _intensitySelector;
@synthesize stonesField = _stonesField;
@synthesize lbsField = _lbsField;
@synthesize timeField = _timeField;
@synthesize exerPointsHeadingLabel = _exerPointsHeadingLabel;
@synthesize exerPointsLabel = _exerPointsLabel;
@synthesize kgsField = _kgsField;
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
    _stonesField.inputAccessoryView = closeKeyboardButton;
    _lbsField.inputAccessoryView = closeKeyboardButton;
    _timeField.inputAccessoryView = closeKeyboardButton;
    _kgsField.inputAccessoryView = closeKeyboardButton;
}

- (void) closeKeyboard:(id)sender {
    if ([_stonesField isFirstResponder])
        [_stonesField resignFirstResponder];
    
    if ([_lbsField isFirstResponder])
        [_lbsField resignFirstResponder];
    
    if ([_timeField isFirstResponder])
        [_timeField resignFirstResponder];
    if ([_kgsField isFirstResponder])
        [_kgsField resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Imperial Workings
- (IBAction)calcSPExerLbs:(id)sender {
    [self checkImperialValues];
}

- (void) checkImperialValues {
    
    [ cf clearPointsLabels:_exerPointsHeadingLabel points:_exerPointsLabel ];
    if ( [_stonesField.text length] == 0 || [_stonesField.text isEqualToString:@"."] ) {
        [cf notifyUsers:@"Stones" msg:@"Enter Stones Value"];
    } else {
        if ( [_lbsField.text length] == 0 || [_lbsField.text isEqualToString:@"."] ) {
            [cf notifyUsers:@"Pounds" msg:@"Enter Pounds Value"];
        } else {
            if ( [_timeField.text length] == 0 || [_timeField.text isEqualToString:@"."] ) {
                [cf notifyUsers:@"Time" msg:@"Enter Time Exercise"];
            } else {

                lowValue = 0.109479270;
                medValue = 0.152862160;
                highValue = 0.383441654;
                
                //Get Time Field Value
                dTime = [_timeField.text doubleValue];
                dStones = [_stonesField.text doubleValue];
                dLbs = [_lbsField.text doubleValue];
                dKG = [cf stoneToKG:dStones lbs:dLbs];
                iIntensity = _intensitySelector.selectedSegmentIndex;
                
                if ( iIntensity == 0 ) {
                    pointsUnrounded = [self calcIntensityPoints:lowValue b:dKG c:dTime];
                } else if ( iIntensity == 1) {
                    pointsUnrounded = [self calcIntensityPoints:medValue b:dKG c:dTime];
                } else {
                    pointsUnrounded = [self calcIntensityPoints:highValue b:dKG c:dTime];
                }
                pointsRounded = [cf roundIt:pointsUnrounded];
                
                //Set Labels
                NSString *pointsString = [NSString stringWithFormat:@"%d", pointsRounded];
                [cf setPointsLabels:_exerPointsHeadingLabel points:_exerPointsLabel value:pointsString];
            }
        }
    }
}

//Metric Workings
- (IBAction)calcSPExerKgs:(id)sender {
    [self checkMetricValues];
}

- (void) checkMetricValues {
    [ cf clearPointsLabels:_exerPointsHeadingLabel points:_exerPointsLabel ];
    
    if ( [_kgsField.text length] == 0 || [_kgsField.text isEqualToString:@"."] ) {
        [cf notifyUsers:@"Kilograms" msg:@"Enter KGs Value"];
    } else {
        if ( [_timeField.text length] == 0 || [_timeField.text isEqualToString:@"."] ) {
            [cf notifyUsers:@"Time" msg:@"Enter Time Exercise"];
        } else {
            lowValue = 0.109479270;
            medValue = 0.152862160;
            highValue = 0.383441654;
            
            //Get Time Field Value
            dTime = [_timeField.text doubleValue];
            dKG = [_kgsField.text doubleValue];
            iIntensity = _intensitySelector.selectedSegmentIndex;
            
            if ( iIntensity == 0 ) {
                pointsUnrounded = [self calcIntensityPoints:lowValue b:dKG c:dTime];
            } else if ( iIntensity == 1) {
                pointsUnrounded = [self calcIntensityPoints:medValue b:dKG c:dTime];
            } else {
                pointsUnrounded = [self calcIntensityPoints:highValue b:dKG c:dTime];
            }
            pointsRounded = [cf roundIt:pointsUnrounded];
            
            //Set Labels
            NSString *pointsString = [NSString stringWithFormat:@"%d", pointsRounded];
            [cf setPointsLabels:_exerPointsHeadingLabel points:_exerPointsLabel value:pointsString];
        }
    }
}



//Common Workings
- (double) calcIntensityPoints :(double)a b:(double)b c:(double)c {
    double points = (a * b * c) / 100;
    return points;
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
