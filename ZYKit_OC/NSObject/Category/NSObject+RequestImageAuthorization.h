
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZYRequestImageAuthorizationStatus) {
    ZYRequestImageAuthorizationStatusNotDetermined = 0,
    ZYRequestImageAuthorizationStatusRestricted,
    ZYRequestImageAuthorizationStatusDenied,
    ZYRequestImageAuthorizationStatusAuthorized
};

@interface NSObject (RequestImageAuthorization)

/*
 使用示例:
 [self zy_requestImageAuthorization:^(ZYRequestImageAuthorizationStatus status) {
 switch (status) {
 break;
 case ZYRequestImageAuthorizationStatusAuthorized:
 case ZYRequestImageAuthorizationStatusNotDetermined:
 {
 [self showSaveImageLoading:@"保存中"];
 [self zy_saveImage:image completeHandler:^(BOOL success, NSError * _Nullable error) {
 [self showSaveImageTips:success ? @"保存成功" : @"保存失败"];
 }];
 break;
 }
 case ZYRequestImageAuthorizationStatusDenied:
 case ZYRequestImageAuthorizationStatusRestricted:
 {
 [self showSaveImageTips:@"请到设置打开相册权限"];
 break;
 }
 }
 }];
 
 */


/**
 请求相册的访问权限

 @param statusBlock 权限的回调
 */
-(void)zy_requestImageAuthorization:(void(^)(ZYRequestImageAuthorizationStatus status))statusBlock;

/**
 保存图片
 
 @param image 图片
 @param completionHandler 保存完成的回调
 */
-(void)zy_saveImage:(UIImage *)image completeHandler:(void(^)(BOOL success, NSError *__nullable error))completionHandler;


/**
 使用data保存图片 可以使用这种方式保存gif

 @param imageData 图片的NSData形式
 @param completionHandler 保存的回调
 */
-(void)zy_saveImageData:(NSData *)imageData completeHandler:(void(^)(BOOL success, NSError *__nullable error))completionHandler;


/**
 根据url判断是否为gif

 @param url image的URL地址
 @return 是否
 */
-(BOOL)zy_isGifWithImageURL:(NSURL *)url;

/**
 根据data判断是否为gif

 @param data image数据
 @return 是否
 */
-(BOOL)zy_isGifWithImageData: (NSData *)data;

@end

NS_ASSUME_NONNULL_END

