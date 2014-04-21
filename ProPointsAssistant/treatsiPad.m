//
//  treatsiPad.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 10/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "treatsiPad.h"
#import "TwoCelliPad.h"

@interface treatsiPad ()

@end

@implementation treatsiPad {
    NSString *fileContents;
    NSArray *mainArray;
    NSArray *lineSplit;
    NSMutableArray *name;
    NSMutableArray *amount;
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

    NSString *filePathOne = [[NSBundle mainBundle] pathForResource:@"treats"
                                                            ofType:@"bc" ];
    
    if (filePathOne != nil) {
        fileContents = [NSString stringWithContentsOfFile:filePathOne
                                                 encoding:NSUTF8StringEncoding
                                                    error:NULL];
        mainArray = [fileContents componentsSeparatedByString:@"\n"];
        
    } else {
        NSLog(@"XCODE: treatsiPad.m line 51. File is empty.. Something has gone wrong");
    }
    
    name = [ [ NSMutableArray alloc] init];
    amount = [ [ NSMutableArray alloc] init];
    for (NSString *string in mainArray) {
        lineSplit = [ string componentsSeparatedByString:@"-"];
        [name addObject:[lineSplit objectAtIndex:0]];
        [amount addObject:[lineSplit objectAtIndex:1]];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [name count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"TwoCelliPad";
    TwoCelliPad *cell = (TwoCelliPad *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TwoCelliPad" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.foodNameiPad.text = [name objectAtIndex:indexPath.row];
    cell.foodAmountiPad.text = [amount objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
