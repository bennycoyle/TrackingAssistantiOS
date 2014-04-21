//
//  OneCelliPad.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 10/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "OneCelliPad.h"

@implementation OneCelliPad
@synthesize foodNameiPad = _foodNameiPad;

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
