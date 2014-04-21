//
//  breakingBadFont.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 06/04/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "breakingBadFont.h"

@implementation breakingBadFont

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.font = [UIFont fontWithName:@"Breaking B" size:self.font.pointSize];
}



@end
