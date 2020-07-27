//
//  zeroPointsView.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 07/01/2018.
//  Copyright © 2018 Brendan Coyle. All rights reserved.
//

#import "purpleZeroSP.h"
#import "OneCelliPhone.h"

@interface purpleZeroSP ()

@end

@implementation purpleZeroSP {
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
    //Process Array one (linesArray)
    NSString *filePathOne = [[NSBundle mainBundle] pathForResource:@"purplezero"
                                                            ofType:@"bc" ];
    
    if (filePathOne != nil) {
        fileContents = [NSString stringWithContentsOfFile:filePathOne
                                                 encoding:NSUTF8StringEncoding
                                                    error:NULL];
        // Do stuff to theContents
        foodArray = [fileContents componentsSeparatedByString:@"\n"];
    } else {
        NSLog(@"XCODE: nocount.m line 46. File is empty.. Something has gone wrong");
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [foodArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"OneCelliPhone";
    OneCelliPhone *cell = (OneCelliPhone *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OneCelliPhone" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.itemName.text = [foodArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

