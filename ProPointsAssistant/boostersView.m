//
//  boostersView.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 08/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "boostersView.h"
#import "OneCelliPhone.h"

@interface boostersView ()

@end

@implementation boostersView {
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
    
    NSString *filePathOne = [[NSBundle mainBundle] pathForResource:@"boostersanddrinks"
                                                            ofType:@"bc" ];
    
    if (filePathOne != nil) {
        fileContents = [NSString stringWithContentsOfFile:filePathOne
                                                 encoding:NSUTF8StringEncoding
                                                    error:NULL];
        // Do stuff to theContents
        foodArray = [fileContents componentsSeparatedByString:@"\n"];
    } else {
        NSLog(@"XCODE: boostersView.m line 46. File is empty.. Something has gone wrong");
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
