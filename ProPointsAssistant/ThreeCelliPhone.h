//
//  ThreeCelliPhone.h
//  TrackingAssistant
//
//  Created by Brendan Coyle on 07/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeCelliPhone : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *foodName;
@property (weak, nonatomic) IBOutlet UILabel *foodAmount;
@property (weak, nonatomic) IBOutlet UILabel *foodPoints;

@end
