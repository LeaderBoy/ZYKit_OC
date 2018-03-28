////
////  AppDelegate+GeTui.m
////  XinHuaShe
////
////  Created by 杨志远 on 2018/1/17.
////  Copyright © 2018年 BaQiWL. All rights reserved.
////
//
//#import "AppDelegate+GeTui.h"
//
//
//static NSString *kGETUI_appID = @"";
//static NSString *kGETUI_appKey = @"";
//static NSString *kGETUI_appSecret = @"";
//
//@implementation AppDelegate (GeTui)
//
//-(void)geTui_initial {
//    NSParameterAssert(kGETUI_appID);
//    NSParameterAssert(kGETUI_appKey);
//    NSParameterAssert(kGETUI_appSecret);
//
//    [GeTuiSdk startSdkWithAppId:kGETUI_appID appKey:kGETUI_appKey appSecret:kGETUI_appSecret delegate:self];
//    [GeTuiSdk runBackgroundEnable:NO];
//}
//-(void)geTui_removeBadge {
//    [GeTuiSdk setBadge:0];
//    [GeTuiSdk resetBadge];
//    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
//}
//
//#pragma mark - 获取deviceToken
//-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
//{
//    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
//    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
//    [GeTuiSdk registerDeviceToken:token];
//}
//
//#pragma mark - 注册远程通知失败
//-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
//{
//    [GeTuiSdk registerDeviceToken:@""];
//}
//
//- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
//    [GeTuiSdk resume];
//    completionHandler(UIBackgroundFetchResultNewData);
//}
///** SDK启动成功返回cid */
//- (void)GeTuiSdkDidRegisterClient:(NSString *)clientId {
//    if (clientId && ![clientId isEqualToString:@""] && self.deviceToken)
//    {
//        [GeTuiSdk registerDeviceToken:self.deviceToken];
//    }
//}
//
///** SDK收到sendMessage消息回调 */
//- (void)GeTuiSdkDidSendMessage:(NSString *)messageId result:(int)result {
//    // [4-EXT]:发送上行消息结果反馈
//}
///** SDK运行状态通知 */
//- (void)GeTuiSDkDidNotifySdkState:(SdkStatus)aStatus {
//    // [EXT]:通知SDK运行状态
//    //    NSLog(@"\n>>>[GexinSdk SdkState]:%u\n\n",aStatus);
//}
//
///** SDK设置推送模式回调 */
//- (void)GeTuiSdkDidSetPushMode:(BOOL)isModeOff error:(NSError *)error {
//}
///** SDK遇到错误回调 */
//- (void)GeTuiSdkDidOccurError:(NSError *)error {
//    
//}
//
//@end

