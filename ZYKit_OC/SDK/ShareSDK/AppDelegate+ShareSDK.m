////
////  AppDelegate+ShareSDK.m
////  Shoppix
////
////  Created by 杨志远 on 2017/9/25.
////  Copyright © 2017年 BaQiWL. All rights reserved.
////
//
//#import "AppDelegate+ShareSDK.h"
//#import <ShareSDK/ShareSDK.h>
//#import <ShareSDK/ShareSDK.h>
//#import <ShareSDKConnector/ShareSDKConnector.h>
////腾讯开放平台（对应QQ和QQ空间）SDK头文件
//#import <TencentOpenAPI/TencentOAuth.h>
//#import <TencentOpenAPI/QQApiInterface.h>
////微信SDK头文件
//#import "WXApi.h"
////新浪微博SDK头文件<
//#import "WeiboSDK.h"
////新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加”-ObjC”
//// QQ
//@interface QQInfo : NSObject
//@property(nonatomic,copy)NSString *appId;
//@property(nonatomic,copy)NSString *appKey;
//
//-(instancetype)initWithAppId:(NSString *)appId appKey:(NSString *)appKey;
//@end
//@implementation QQInfo
//-(instancetype)initWithAppId:(NSString *)appId appKey:(NSString *)appKey {
//    NSParameterAssert(appId);
//    NSParameterAssert(appKey);
//    if (self = [super init]) {
//        _appId = appId;
//        _appKey = appKey;
//    }
//    return self;
//}
//@end
//
//// 微信
//@interface WeChatInfo : NSObject
//@property(nonatomic,copy)NSString *appId;
//@property(nonatomic,copy)NSString *appSecret;
//
//-(instancetype)initWithAppId:(NSString *)appId appSecret:(NSString *)appSecret;
//@end
//@implementation WeChatInfo
//-(instancetype)initWithAppId:(NSString *)appId appSecret:(NSString *)appSecret {
//    NSParameterAssert(appId);
//    NSParameterAssert(appSecret);
//    if (self = [super init]) {
//        _appId = appId;
//        _appSecret = appSecret;
//    }
//    return self;
//}
//@end
//
//// 新浪微博
//@interface SinaWeiboInfo : NSObject
//@property(nonatomic,copy)NSString *appKey;
//@property(nonatomic,copy)NSString *appSecret;
//@property(nonatomic,copy)NSString *redirectUri;
//
//-(instancetype)initWithAppKey:(NSString *)appKey appSecret:(NSString *)appSecret redirectUri:(NSString *)redirectUri;
//
//@end
//
//@implementation SinaWeiboInfo
//
//-(instancetype)initWithAppKey:(NSString *)appKey appSecret:(NSString *)appSecret redirectUri:(NSString *)redirectUri {
//    NSParameterAssert(appKey);
//    NSParameterAssert(appSecret);
//    if (self = [super init]) {
//        _appKey = appKey;
//        _appSecret = appSecret;
//        _redirectUri = redirectUri ?: @"http://www.sharesdk.cn";
//    }
//    return self;
//}
//
//@end
//
//
//
//@implementation AppDelegate (ShareSDK)
//
//-(void)initialShareSDK {
//    QQInfo *QQ = [[QQInfo alloc] initWithAppId:@"" appKey:@""];
//    
//    WeChatInfo *WeChat = [[WeChatInfo alloc] initWithAppId:@"" appSecret:@""];
//    
//    SinaWeiboInfo *SinaWeibo = [[SinaWeiboInfo alloc] initWithAppKey:@"" appSecret:@"" redirectUri:@""];
//    
//    
//    
//    
//    [ShareSDK registerActivePlatforms:@[
//                                        @(SSDKPlatformTypeSinaWeibo),
//                                        @(SSDKPlatformTypeWechat),
//                                        @(SSDKPlatformTypeQQ)
//                                        ]
//                             onImport:^(SSDKPlatformType platformType)
//     {
//         switch (platformType)
//         {
//             case SSDKPlatformTypeWechat:
//                 [ShareSDKConnector connectWeChat:[WXApi class]];
//                 break;
//             case SSDKPlatformTypeQQ:
//                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
//                 break;
//             case SSDKPlatformTypeSinaWeibo:
//                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
//                 break;
//
//             default:
//                 break;
//         }
//     }
//                      onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
//     {
//         switch (platformType)
//         {
//             case SSDKPlatformTypeSinaWeibo:
//                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
//                 [appInfo SSDKSetupSinaWeiboByAppKey:SinaWeibo.appKey
//                                           appSecret:SinaWeibo.appSecret
//                                         redirectUri:SinaWeibo.redirectUri
//                                            authType:SSDKAuthTypeBoth];
//                 break;
//             case SSDKPlatformTypeWechat:
//                 [appInfo SSDKSetupWeChatByAppId:WeChat.appId
//                                       appSecret:WeChat.appSecret];
//                 break;
//             case SSDKPlatformTypeQQ:
//                 [appInfo SSDKSetupQQByAppId:QQ.appId
//                                      appKey:QQ.appKey
//                                    authType:SSDKAuthTypeBoth];
//                 break;
//             
//             
//             
//             default:
//                 break;
//            }
//     }];
//}
//@end

