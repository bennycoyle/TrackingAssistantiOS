//
//  fAndHiPad.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 10/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "fAndHiPad.h"
#import "OneCelliPad.h"

@interface fAndHiPad ()

@end

@implementation fAndHiPad {
    NSString *fileContents;
    NSArray *foodArray;
}


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
    NSString *filePathOne = [[NSBundle mainBundle] pathForResource:@"fillingandhealthy"
                                                            ofType:@"bc" ];
    
    if (filePathOne != nil) {
        fileContents = [NSString stringWithContentsOfFile:filePathOne
                                                 encoding:NSUTF8StringEncoding
                                                    error:NULL];
        // Do stuff to theContents
        foodArray = [fileContents componentsSeparatedByString:@"\n"];
    } else {
        NSLog(@"XCODE: fAndHiPad.m line 46. File is empty.. Something has gone wrong");
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [foodArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"OneCelliPad";
    OneCelliPad *cell = (OneCelliPad *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OneCelliPad" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.foodNameiPad.text = [foodArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
