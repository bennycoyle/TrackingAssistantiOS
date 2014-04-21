//
//  ThreeCelliPad.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 10/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "ThreeCelliPad.h"

@implementation ThreeCelliPad
@synthesize foodNameiPad = _foodNameiPad;
@synthesize foodAmountiPad = _foodAmountiPad;
@synthesize foodPointsiPad = _foodPointsiPad;

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
