//
//  commonFunctions.h
//  TrackingAssistant
//
//  Created by Brendan Coyle on 13/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface commonFunctions : NSObject


- (void) moveView: (UITextField*) textField up: (BOOL) up : (int) distance : (UIView*) ViewToMove;
- (void) createKeyboard:(UIToolbar *)closeKeyboardToolbar view:(UIView *) passedView;
- (void) notifyUsers:(NSString *)title msg:(NSString *) msg;
- (void) setPointsLabels:(UILabel *)heading points:(UILabel *)points value:(NSString *)value;
- (void) clearPointsLabels:(UILabel *)heading points:(UILabel *)points;
- (void) setupColor:(UINavigationBar *) navBar myView:(UIView *) myView;
- (double) feetToCM:(double)feet inches:(double)inches;
- (double) stoneToKG:(double) stones lbs:(double) lbs;
- (int)roundIt:(double)a;


@end
