//
//  JRViewController.h
//  ColorArt iOS
//
//  Created by James Reuss on 05/05/2013.
//  Copyright (c) 2013 James Reuss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCFadedImageView_iOS.h"

@interface JRViewController : UIViewController {
	BOOL onGoat;
}

@property (weak, nonatomic) IBOutlet PCFadedImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *primary;
@property (weak, nonatomic) IBOutlet UILabel *secondary;
@property (weak, nonatomic) IBOutlet UILabel *detail;

- (IBAction)nextImage:(id)sender;
- (IBAction)animateNextImage:(id)sender;

@end
