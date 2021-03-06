//
//  AppDelegate.m
//  TrackingAssistant
//
//  Created by Brendan Coyle on 07/02/2014.
//  Copyright (c) 2014 Brendan Coyle. All rights reserved.
//

#import "AppDelegate.h"
#import <StoreKit/StoreKit.h>

@implementation AppDelegate {
    UIViewController *viewController;
    NSString *measurement;
    NSString *plan;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //if( ! [defaults objectForKey:@"plan"]) {
    //    [defaults setObject:@"SmartPoints" forKey:@"plan"];
    //}
    if( ! [defaults objectForKey:@"measurement"]) {
        [defaults setObject:@"LBs" forKey:@"measurement"];
    }
    //UIViewController *viewController;
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];

    //plan = [defaults objectForKey:@"plan"];
    plan = @"SmartPoints";
    measurement = [defaults objectForKey:@"measurement"];
    
    #define IDIOM    UI_USER_INTERFACE_IDIOM()
    #define IPAD     UIUserInterfaceIdiomPad

    //Storyboard ID here really, really confused me..
    //but it's in the <AppName>-info.plist file...
    //Main storyboard..... <Just make sure take iPhone for iPhone and iPad for iPad, duh!>
    
    
    if ( IDIOM != IPAD ) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        
        if ( [plan isEqualToString:@"ProPoints"] ) {
            if ( [measurement isEqualToString:@"KGs"] ) {
                //ViewOne is the StoryBoard ID I specified for the controller in storyboard editor
                viewController = [storyboard instantiateViewControllerWithIdentifier:@"iPhoneKGs"];
            } else if ( [measurement isEqualToString:@"LBs"] ) {
                //ViewTwois the StoryBoard ID I specified for the controller in storyboard editor
                viewController = [storyboard instantiateViewControllerWithIdentifier:@"iPhoneLBs"];
            } else {
                NSLog(@"Pants...");
            }
        }
        
        if ( [plan isEqualToString:@"SmartPoints"] ) {
            if ( [measurement isEqualToString:@"KGs"] ) {
                //ViewOne is the StoryBoard ID I specified for the controller in storyboard editor
                viewController = [storyboard instantiateViewControllerWithIdentifier:@"SPiPhoneKGs"];
            } else if ( [measurement isEqualToString:@"LBs"] ) {
                //ViewTwois the StoryBoard ID I specified for the controller in storyboard editor
                viewController = [storyboard instantiateViewControllerWithIdentifier:@"SPiPhoneLBs"];
            } else {
                NSLog(@"Pants...");
            }
        }
        self.window.rootViewController = viewController;
        [self.window makeKeyAndVisible];
    }
   
    if ( IDIOM == IPAD ) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
        if ( [plan isEqualToString:@"ProPoints"] ) {
            if ( [measurement isEqualToString:@"KGs"] ) {
                //ViewOne is the StoryBoard ID I specified for the controller in storyboard editor
                viewController = [storyboard instantiateViewControllerWithIdentifier:@"iPadKGs"];
            
            } else if ( [measurement isEqualToString:@"LBs"] ) {
                //ViewTwo is the StoryBoard ID I specified for the controller in storyboard editor
                viewController = [storyboard instantiateViewControllerWithIdentifier:@"iPadLBs"];
            } else {
                NSLog(@"Shouldn't Reach here");
            }
        }
        if ( [plan isEqualToString:@"SmartPoints"] ) {
            if ( [measurement isEqualToString:@"KGs"] ) {
                //ViewOne is the StoryBoard ID I specified for the controller in storyboard editor
                viewController = [storyboard instantiateViewControllerWithIdentifier:@"SPiPadKGs"];
                
            } else if ( [measurement isEqualToString:@"LBs"] ) {
                //ViewTwo is the StoryBoard ID I specified for the controller in storyboard editor
                viewController = [storyboard instantiateViewControllerWithIdentifier:@"SPiPadLBs"];
            } else {
                NSLog(@"Shouldn't Reach here");
            }
        }
        
        self.window.rootViewController = viewController;
        [self.window makeKeyAndVisible];
    }
    
    //Putting this in to request a review from the user's
    int shortestTime = 15;
    int longestTime = 60;
    int timeInterval = arc4random_uniform(longestTime - shortestTime) + shortestTime;
    
    [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(requestReview) userInfo:nil repeats:NO];
    
    
    return YES;
}

- (void)requestReview {
    [SKStoreReviewController requestReview];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




@end
