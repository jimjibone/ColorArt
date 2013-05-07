//
//  PCFadedImageView_iOS.m
//  Crates
//
//  Created by James Reuss on 04/05/2013.
//  Copyright (c) 2013 James Reuss. All rights reserved.
//

#import "PCFadedImageView_iOS.h"
#import <QuartzCore/QuartzCore.h>

@implementation PCFadedImageView

- (void)awakeFromNib
{
	// Clear the background!
	[self setBackgroundColor:[UIColor clearColor]];
}

- (void)setImage:(UIImage *)image
{
	[self setImage:image pinned:PIN_LEFT];
}

- (void)setImage:(UIImage *)image pinned:(enum ImagePinning)pin
{
		
	if (_imageView == nil) {
		
		// Make a new image view and initialise it with the image we want.
		_imageView = [[UIImageView alloc] initWithImage:image];
		
		[self addSubview:self.imageView];
		
	} else {
		
		// We're all good here.
		[self.imageView setImage:image];
		
	}
	
	if (image) {
		// Sort out the frame and the gradient.
		double ratio = image.size.width/image.size.height;
		CGSize fitted = CGSizeMake(self.bounds.size.height * ratio, self.bounds.size.height);
		CGRect newFrame = self.bounds;
		newFrame.size = fitted;
		
		switch (pin) {
			case PIN_RIGHT:
				newFrame.origin = CGPointMake(0, 0);
				break;
				
			case PIN_CENTRE:
				newFrame.origin = CGPointMake((int)(self.bounds.size.width - fitted.width)/2, 0);
				break;
				
			default: // PIN_LEFT
				newFrame.origin = CGPointMake(self.bounds.size.width - fitted.width, 0);
				break;
		}
		_imageView.frame = newFrame;
		
		// Set up the gradient.
		CAGradientLayer *gradient = [CAGradientLayer layer];
		gradient.frame = CGRectMake(0, 0, newFrame.size.width, newFrame.size.height);
		gradient.colors = @[(id)[[UIColor clearColor] CGColor], (id)[[UIColor blackColor] CGColor]];
		
		gradient.startPoint = CGPointMake(0.3, 0.0f);
		gradient.endPoint   = CGPointMake(0.9, 0.0f);
		
		self.imageView.layer.mask = gradient;
	}
	
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return [self.imageView valueForKey:key];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
	NSLog(@"%@ %@ - key:%@   value:%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), key, value);
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    [self.imageView setValue:value forKey:key];
}

@end
