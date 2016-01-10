//
//  alcoholiPad.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 10/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "alcoholiPad.h"
#import "ThreeCelliPad.h"
#import "commonFunctions.h"

@interface alcoholiPad (){
    commonFunctions *cf;
}


@end

@implementation alcoholiPad {
    NSString *fileContents;
    NSArray *mainArray;
    NSArray *lineSplit;
    NSMutableArray *name;
    NSMutableArray *amount;
    NSMutableArray *points;
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
    
    cf = [[commonFunctions alloc]init];
    [cf setupColor:self.navigationController.navigationBar myView:self.view];
    
    NSString *filePathOne = [[NSBundle mainBundle] pathForResource:@"alcohol"
                                                            ofType:@"bc" ];
    
    if (filePathOne != nil) {
        fileContents = [NSString stringWithContentsOfFile:filePathOne
                                                 encoding:NSUTF8StringEncoding
                                                    error:NULL];
        mainArray = [fileContents componentsSeparatedByString:@"\n"];
        
    } else {
        NSLog(@"XCODE: alcohol.m line 58. File is empty.. Something has gone wrong");
    }
    
    name = [ [ NSMutableArray alloc] init];
    amount = [ [ NSMutableArray alloc] init];
    points = [ [ NSMutableArray alloc] init];
    for (NSString *string in mainArray) {
        lineSplit = [ string componentsSeparatedByString:@"-"];
        [name addObject:[lineSplit objectAtIndex:0]];
        [amount addObject:[lineSplit objectAtIndex:1]];
        [points addObject:[lineSplit objectAtIndex:2]];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [name count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ThreeCelliPad";
    ThreeCelliPad *cell = (ThreeCelliPad *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ThreeCelliPad" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.foodNameiPad.text = [name objectAtIndex:indexPath.row];
    cell.foodAmountiPad.text = [amount objectAtIndex:indexPath.row];
    cell.foodPointsiPad.text = [points objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
