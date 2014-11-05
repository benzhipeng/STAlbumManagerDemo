//
//  ViewController.m
//  STAlbumManagerDemo
//
//  Created by B.E.N on 14/11/5.
//  Copyright (c) 2014年 etouch. All rights reserved.
//

#import "ViewController.h"
#import "STAlbumManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender{
    
    [loadingView startAnimating];
    STImageWriteToPhotosAlbum(imageView.image, @"STKit相册", ^(UIImage *image, NSError *error){
        
        [loadingView stopAnimating];
        if(error){
            if (error.code == ALAssetsLibraryAccessUserDeniedError) {
                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"请在iPhone的\"设置-隐私-照片\"选项中,允许该应用访问你的照片。" message:nil delegate:nil  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alertView show];
            }else if(error.code == ALAssetsLibraryWriteDiskSpaceError){
                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"存储空间不足,请在iPhone的\"设置-通用-用量\"选项中设置。" message:nil delegate:nil  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alertView show];
            }
        }else {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"保存成功" message:nil delegate:nil  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
        }
    });
}
@end
