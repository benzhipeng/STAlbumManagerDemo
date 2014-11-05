//
//  ViewController.h
//  STAlbumManagerDemo
//
//  Created by B.E.N on 14/11/5.
//  Copyright (c) 2014年 etouch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIImageView* imageView;
    IBOutlet UIActivityIndicatorView* loadingView;
}
- (IBAction)save:(id)sender;
@end

