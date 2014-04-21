//
//  stitchyTimesFont.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 10/04/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "stitchyTimesFont.h"

@implementation stitchyTimesFont

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
    self.font = [UIFont fontWithName:@"StitchyTimes" size:self.font.pointSize];
}



@end
