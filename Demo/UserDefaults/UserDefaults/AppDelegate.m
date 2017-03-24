//
//  AppDelegate.m
//  UserDefaults
//
//  Created by HeFengyang on 2017/3/21.
//  Copyright © 2017年 hihfy. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //https://forums.developer.apple.com/thread/28030
    //
    //https://forums.developer.apple.com/message/135342#135342
    //
    //https://forums.developer.apple.com/thread/44264
    //
    //https://forums.developer.apple.com/thread/15685
    //
    //https://developer.apple.com/reference/foundation/nsfileprotectioncompleteuntilfirstuserauthentication
    
    // 产生原因设备：5s,iOS9.3.5
    
    // 先运行一次，将数据写入，然后注解
//    [[NSUserDefaults standardUserDefaults] setObject:@"test" forKey:@"test"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    NSFileProtectionCompleteUntilFirstUserAuthentication
    
    NSString *test;
    NSInteger i = 0;
    NSInteger j;
    do {
        i++;
        // j 不是0...
        j++;
        test = [[NSUserDefaults standardUserDefaults] stringForKey:@"test"];
        NSLog(@"-->>>%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"test"]);
        if (i == 1) {
            break;
        }
    } while (test);
    
    BOOL protectedDataAvailable =  [UIApplication sharedApplication].protectedDataAvailable;
    if (protectedDataAvailable == YES) {
        [self launchApp];
    } else {
        NSLog(@"protected_Data_NOT_Available");
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(protectedDataAvailableNotification:) name:UIApplicationProtectedDataDidBecomeAvailable object:nil];
    }
    
    return YES;
}

- (void) protectedDataAvailableNotification:(NSNotification*) notification
{
    NSLog(@"protectedDataAvailableNotification");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationProtectedDataDidBecomeAvailable object:nil];
    [self launchApp];
}

- (void)launchApp {

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
