//
//  ThreeCelliPhone.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 07/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "ThreeCelliPhone.h"

@implementation ThreeCelliPhone
@synthesize foodName = _foodName;
@synthesize foodAmount = _foodAmount;
@synthesize foodPoints = _foodPoints;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
