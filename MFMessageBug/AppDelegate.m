//
//  AppDelegate.m
//  MFMessageBug
//
//  Created by Mark Gill on 3/31/16.
//  Copyright © 2016 edify. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *navController =
    [[UINavigationController alloc] initWithRootViewController:viewController];
    navController.navigationBar.hidden = YES;
    
    [self.window setRootViewController:navController];
    
    return YES;
}

@end
