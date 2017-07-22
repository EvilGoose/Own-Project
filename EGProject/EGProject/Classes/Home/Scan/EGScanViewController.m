//
//  EGScanViewController.m
//  EGProject
//
//  Created by EG on 2017/7/18.
//  Copyright © 2017年 EGMade. All rights reserved.
//

#import "EGScanViewController.h"

#import "EGCameraManager.h"

@interface EGScanViewController ()
<
UINavigationControllerDelegate,
UIImagePickerControllerDelegate
>

@end

@implementation EGScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
            // 初始化图片选择控制器
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        /*设置媒体来源，即调用出来的UIImagePickerController所显示出来的界面，有一下三种来源
         typedef NS_ENUM(NSInteger, UIImagePickerControllerSourceType) {
         UIImagePickerControllerSourceTypePhotoLibrary,
         UIImagePickerControllerSourceTypeCamera,
         UIImagePickerControllerSourceTypeSavedPhotosAlbum
         };分别表示：图片列表，摄像头，相机相册*/
        [controller setSourceType:UIImagePickerControllerSourceTypeCamera];
            // 设置所支持的媒体功能，即只能拍照，或则只能录像，或者两者都可以
        NSString *requiredMediaType = ( NSString *)kUTTypeImage;
        NSString *requiredMediaType1 = ( NSString *)kUTTypeMovie;
        NSArray *arrMediaTypes=[NSArray arrayWithObjects:requiredMediaType, requiredMediaType1,nil];
        [controller setMediaTypes:arrMediaTypes];
            // 设置录制视频的质量
        [controller setVideoQuality:UIImagePickerControllerQualityTypeHigh];
            //设置最长摄像时间
        [controller setVideoMaximumDuration:10.f];
            // 设置是否可以管理已经存在的图片或者视频
        [controller setAllowsEditing:YES];
        [controller setDelegate:self];
        [self.navigationController presentViewController:controller animated:YES completion:nil];
    }
}

#pragma mark - 判断相机是否可用

- (BOOL) isCameraAvailable {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isFrontCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

#pragma mark - 判断相册是否可用
- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self cameraSupportsMedia:( NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self cameraSupportsMedia:( NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

    // 判断是否支持某种多媒体类型：拍照，视频,
- (BOOL)cameraSupportsMedia:(NSString*)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType {
    __block BOOL result=NO;
    if ([paramMediaType length]==0) {
         return NO;
    }
    
    NSArray*availableMediaTypes=[UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop = YES;
        }
    }];
    
    return result;
}

- (BOOL) doesCameraSupportTakingPhotos{
    /*在此处注意我们要将MobileCoreServices 框架添加到项目中，
     然后将其导入：#import <MobileCoreServices/MobileCoreServices.h> 。不然后出现错误使用未声明的标识符 'kUTTypeImage'
     */
    return [self cameraSupportsMedia:( NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

@end
