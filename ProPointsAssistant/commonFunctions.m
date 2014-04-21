//
//  commonFunctions.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 13/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "commonFunctions.h"

@implementation commonFunctions




//My Code
- (void) moveView: (UITextField*) textField up: (BOOL) up : (int) distance : (UIView*) ViewToMove
{
    
    const int movementDistance = distance; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    ViewToMove.frame = CGRectMake(ViewToMove.frame.origin.x, (ViewToMove.frame.origin.y + movement), ViewToMove.frame.size.width, ViewToMove.frame.size.height);
    [UIView commitAnimations];
}

- (void) createKeyboard:(UIToolbar *)closeKeyboardToolbar view:(UIView *) passedView
{
    //Create the Bar
    closeKeyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, passedView.bounds.size.width, 34)];
    //Create the 'Done' button
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                 target:self
                                                                                 action:@selector(closeKeyboard:)];
    closeButton.width = 70.0f;
    
    //Other Buttons that I may use
    UIBarButtonItem *closeKButton = [[UIBarButtonItem alloc] initWithTitle:@"Close Keyboard"
                                                                     style:UIBarButtonItemStyleBordered
                                                                    target:self
                                                                    action:@selector(closeKeyboard:)];
    
    //Space Item
    UIBarButtonItem *spaceOne = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                              target:self action:nil];
    
    [closeKeyboardToolbar setItems:[[NSArray alloc] initWithObjects:spaceOne, closeKButton, spaceOne, nil]  ];
    

}

- (void) notifyUsers:(NSString *)title msg:(NSString *) msg {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:(@"%@", title)
                          message:(@"%@", msg)
                          delegate:Nil
                          cancelButtonTitle:@"Close Message"
                          otherButtonTitles:nil, nil];
    [alert show];
}

- (void) setPointsLabels:(UILabel *)heading points:(UILabel *)points value:(NSString *)value {
    [heading setText:@"Points"];
    [points setText:value];
}
- (void) clearPointsLabels:(UILabel *)heading points:(UILabel *)points {
    [heading setText:@""];
    [points setText:@""];
}

- (void) setupColor:(UINavigationBar *) navBar myView:(UIView *) myView
{
    //Do Stuff
    [navBar setTintColor:[UIColor purpleColor] ];
    navBar.barTintColor = [UIColor orangeColor];
    myView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

- (int) roundIt:(double)a {
    
    NSString *temp = [NSString stringWithFormat:@"%f", a];
    
    NSArray* tempArray = [temp componentsSeparatedByString:@"."];
    
    NSString *wholeNumber = [tempArray objectAtIndex:0];
    
    double dWholeNumber = [wholeNumber doubleValue];
    double dRemainder = a - dWholeNumber;
    double finalRemainder = 0;
    
    if ( dRemainder >= 0 && dRemainder < 0.50 ) {
        finalRemainder = 0;
        NSLog(@"Whole: %f, Remainder: %f. The Fucker is less than 0.5 fo sho", dWholeNumber, dRemainder);
    } else if ( dRemainder >= 0.5 && dRemainder < 1 ) {
        finalRemainder = 1;
        NSLog(@"Whole: %f, Remainder: %f. The Fucker is greater than 0.5 fo sho", dWholeNumber, dRemainder);
    }
    
    double pointsFinal = dWholeNumber + finalRemainder;
    int returnPoints = (int)pointsFinal;
    return returnPoints;
}


- (double) feetToCM:(double)feet inches:(double)inches {
    
    inches = ( ( feet * 12 ) + inches );
    double cm = inches * 2.54;
    cm = [self roundIt:cm];
    return cm;
}

- (double) stoneToKG:(double) stones lbs:(double) lbs {
    lbs = ( ( stones * 14 ) + lbs );
    double kg = lbs * 0.45359237;
    return kg;
}

@end
