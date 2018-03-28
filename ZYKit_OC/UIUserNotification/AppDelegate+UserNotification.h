

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>

/**
 用于通知
 */
@interface AppDelegate (UserNotification)<UNUserNotificationCenterDelegate>

/**
 通知的注册  初始化
 */
-(void)userNotification_initial;
/**
 清除通知栏的通知
 */
- (void)userNotification_remove;
@end
