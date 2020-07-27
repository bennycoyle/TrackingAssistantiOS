//
//  smartPointsList.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 08/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "purpleSmartPoints.h"
#import "ThreeCelliPhone.h"
#import "commonFunctions.h"

@interface purpleSmartPoints () {
    commonFunctions *cf;
}

@end

@implementation purpleSmartPoints {
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
    // Do any additional setup after loading the view.
    
    cf = [[commonFunctions alloc]init];
    [cf setupColor:self.navigationController.navigationBar myView:self.view];
    
    //Process Array one (linesArray)
    NSString *filePathOne = [[NSBundle mainBundle] pathForResource:@"purplesmartpoints"
                                                            ofType:@"bc" ];
    
    if (filePathOne != nil) {
        fileContents = [NSString stringWithContentsOfFile:filePathOne
                                                 encoding:NSUTF8StringEncoding
                                                    error:NULL];
        // Do stuff to theContents
        mainArray = [fileContents componentsSeparatedByString:@"\n"];
        
    } else {
        NSLog(@"XCODE: smartPointsList.m line 60. File is empty.. Something has gone wrong");
    }
    
    //Initialize arrays.
    name = [ [ NSMutableArray alloc] init];
    amount = [ [ NSMutableArray alloc] init];
    points = [ [ NSMutableArray alloc] init];
    //now, lets go thorough the array and then split it again.
    for (NSString *string in mainArray) {
        if([string length] != 0) {
            lineSplit = [ string componentsSeparatedByString:@"-"];
            [name addObject:[lineSplit objectAtIndex:0]];
            [amount addObject:[lineSplit objectAtIndex:1]];
            [points addObject:[lineSplit objectAtIndex:2]];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [name count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ThreeCelliPhone";
    ThreeCelliPhone *cell = (ThreeCelliPhone *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ThreeCelliPhone" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.foodName.text = [name objectAtIndex:indexPath.row];
    cell.foodAmount.text = [amount objectAtIndex:indexPath.row];
    cell.foodPoints.text = [points objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
