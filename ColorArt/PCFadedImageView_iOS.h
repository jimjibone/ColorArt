//
//  PCFadedImageView_iOS.h
//  Crates
//
//  Created by James Reuss on 04/05/2013.
//  Copyright (c) 2013 James Reuss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCFadedImageView : UIView {
	
	enum ImagePinning {
		PIN_RIGHT = 0,
		PIN_CENTRE,
		PIN_LEFT
	};
	
}

@property (nonatomic, retain) UIImageView *imageView;

- (void)setImage:(UIImage *)image;
- (void)setImage:(UIImage *)image pinned:(enum ImagePinning)pin;

@end
