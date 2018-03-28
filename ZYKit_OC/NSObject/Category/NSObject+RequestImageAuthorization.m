
#import "NSObject+RequestImageAuthorization.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>



@implementation NSObject (RequestImageAuthorization)

-(void)zy_requestImageAuthorization:(void(^)(ZYRequestImageAuthorizationStatus status))statusBlock {
    if (@available(iOS 9.0,*)) {
        [self zy_requestImageAuthorizationAfterIOSNine:statusBlock];
    }else{
        [self zy_requestImageAuthorizationBeforeIOSNine:statusBlock];
    }
}

/**
 iOS9 之后请求访问图片的权限

 @param statusBlock 权限的回调
 */
-(void)zy_requestImageAuthorizationAfterIOSNine:(void(^)(ZYRequestImageAuthorizationStatus status))statusBlock {
    if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                statusBlock((ZYRequestImageAuthorizationStatus)status);

            });
        }];
    }else {
        statusBlock((ZYRequestImageAuthorizationStatus)[PHPhotoLibrary authorizationStatus]);
    }
}

/**
 iOS9之前请求访问图片的权限

 @param statusBlock 权限的回调
 */
-(void)zy_requestImageAuthorizationBeforeIOSNine:(void(^)(ZYRequestImageAuthorizationStatus status))statusBlock {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    //过期的方法
    statusBlock((ZYRequestImageAuthorizationStatus)[ALAssetsLibrary authorizationStatus]);
#pragma clang diagnostic pop
}


/**
 保存图片

 @param image 图片
 @param completionHandler 保存完成的回调
 */
-(void)zy_saveImage:(UIImage *)image completeHandler:(nonnull void (^)(BOOL, NSError * _Nullable))completionHandler {
    if (@available(iOS 9.0,*)) {
        [self zy_saveImageAfterIOSNine:image completeHandler:completionHandler];
    }else{
        [self zy_saveImageBeforeIOSNine:image completeHandler:completionHandler];
    }
}

/**
 iOS9 之前的保存图片的方式

 @param image 图片
 @param completionHandler 保存完成的回调
 */
-(void)zy_saveImageBeforeIOSNine:(UIImage *)image completeHandler:(nonnull void (^)(BOOL, NSError * _Nullable))completionHandler {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    //过期的方法
    ALAssetsLibrary *lib = [[ALAssetsLibrary alloc] init];
    [lib writeImageToSavedPhotosAlbum:image.CGImage metadata:nil completionBlock:^(NSURL *assetURL, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                completionHandler(YES,error);
            }else{
                completionHandler(NO,error);
            }
        });
    }];
#pragma clang diagnostic pop
    
}

/**
 iOS9 之后的保存图片的方式

 @param image 图片
 @param completionHandler 保存完成的回调
 */
-(void)zy_saveImageAfterIOSNine:(UIImage *)image completeHandler:(nonnull void (^)(BOOL, NSError * _Nullable))completionHandler {
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        [PHAssetChangeRequest creationRequestForAssetFromImage:image];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(success,error);
        });
    }];
}


-(void)zy_saveImageData:(NSData *)imageData completeHandler:(void (^)(BOOL, NSError * _Nullable))completionHandler {
    if (@available(iOS 9.0,*)) {
        [self zy_saveImageDataAfterIOSNine:imageData completeHandler:completionHandler];
    }else {
        [self zy_saveImageDataBeforeIOSNine:imageData completeHandler:completionHandler];
    }
}

-(void)zy_saveImageDataBeforeIOSNine:(NSData *)imageData completeHandler:(nonnull void (^)(BOOL success, NSError * _Nullable error))completionHandler {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    //过期的方法
    ALAssetsLibrary *lib = [[ALAssetsLibrary alloc] init];
    
    [lib writeImageDataToSavedPhotosAlbum:imageData metadata:nil completionBlock:^(NSURL *assetURL, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                completionHandler(YES,error);
            }else{
                completionHandler(NO,error);
            }
        });
    }];
#pragma clang diagnostic pop
    
}
-(void)zy_saveImageDataAfterIOSNine:(NSData *)imageData completeHandler:(nonnull void (^)(BOOL, NSError * _Nullable))completionHandler {
    if (@available(iOS 9.0,*)) {
        [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            PHAssetResourceCreationOptions *options = [[PHAssetResourceCreationOptions alloc] init];
            [[PHAssetCreationRequest creationRequestForAsset] addResourceWithType:PHAssetResourceTypePhoto data:imageData options:options];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(success,error);
            });
        }];
    }
    
}



-(BOOL)zy_isGifWithImageURL:(NSURL *)url {
    if (!url) {
        return NO;
    }
    NSData *data = [NSData dataWithContentsOfURL:url];
    return [self zy_isGifWithImageData:data];
}

-(BOOL)zy_isGifWithImageData:(NSData *)data {
    if ([[self contentTypeWithImageData:data] isEqualToString:@"gif"]) {
        return YES;
    }
    return NO;
}

-(NSString *)contentTypeWithImageData: (NSData *)data {
    
    uint8_t c;
    
    [data getBytes:&c length:1];
    
    switch (c) {
            
        case 0xFF:
            
            return @"jpeg";
            
        case 0x89:
            
            return @"png";
            
        case 0x47:
            
            return @"gif";
            
        case 0x49:
            
        case 0x4D:
            
            return @"tiff";
            
        case 0x52:
            
            if ([data length] < 12) {
                
                return nil;
                
            }
            
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                
                return @"webp";
                
            }
            
            return nil;
            
    }
    
    return nil;
}



@end
