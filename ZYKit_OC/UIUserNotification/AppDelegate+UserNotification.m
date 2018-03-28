
#import "AppDelegate+UserNotification.h"
#import "AppDelegate+GeTui.h"
//Controller



@implementation AppDelegate (UserNotification)

-(void)userNotification_initial {
    
    if (@available(iOS 10.0,*)) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        UNAuthorizationOptions options = UNAuthorizationOptionAlert |
        UNAuthorizationOptionBadge |
        UNAuthorizationOptionSound;
        
        [center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (!error)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[UIApplication sharedApplication]registerForRemoteNotifications];
                });
            }
        }];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        //过期的方法
        UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge |
        UIUserNotificationTypeSound;
        
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
        
        [[UIApplication sharedApplication]registerUserNotificationSettings:settings];
#pragma clang diagnostic pop
        [[UIApplication sharedApplication]registerForRemoteNotifications];
    }
    [self userNotification_remove];
}

- (void)userNotification_remove {
    if (@available(iOS 10.0,*)) {
        [[UNUserNotificationCenter currentNotificationCenter] removeAllPendingNotificationRequests];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        //过期的方法
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
#pragma clang diagnostic pop
    }
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}
#pragma mark - iOS 10之前收到远程通知

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    if ([UIApplication sharedApplication].applicationState != UIApplicationStateBackground) {
//        NSString * payload = [userInfo objectForKey:@"payload"];
        
    }
    [self userNotification_remove];
//    [self geTui_removeBadge];
    completionHandler(UIBackgroundFetchResultNewData);
}
#pragma mark - iOS 10之后收到通知(远程和本地)
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler NS_AVAILABLE_IOS(10_0){
    if ([UIApplication sharedApplication].applicationState != UIApplicationStateBackground) {
//        NSString *payload =[response.notification.request.content.userInfo objectForKey:@"payload"];
    }
    [self userNotification_remove];
//    [self geTui_removeBadge];
    completionHandler();
}




@end
