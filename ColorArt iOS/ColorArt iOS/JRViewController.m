//
//  JRViewController.m
//  ColorArt iOS
//
//  Created by James Reuss on 05/05/2013.
//  Copyright (c) 2013 James Reuss. All rights reserved.
//

#import "JRViewController.h"
#import "SLColorArt_iOS.h"
#import "UIImage+ColorArt.h"

@interface JRViewController ()

@end

@implementation JRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	onGoat = NO;
	[self nextImage:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextImage:(id)sender {
	onGoat = !onGoat;
	//UIImage *image = [UIImage imageNamed:(onGoat) ? @"goat.jpg" : @"chicken.jpg"];
	UIImage *image = [UIImage imageNamed:(onGoat) ? @"2012.jpeg" : @"2013.jpeg"];
	
	SLColorArt *colorArt = [image colorArt];
	
	self.view.backgroundColor = colorArt.backgroundColor;
	self.primary.textColor = colorArt.primaryColor;
	self.secondary.textColor = colorArt.secondaryColor;
	self.detail.textColor = colorArt.detailColor;
	
	[self.imageView setImage:image];
}

- (IBAction)animateNextImage:(id)sender {
	onGoat = !onGoat;
	//UIImage *image = [UIImage imageNamed:(onGoat) ? @"goat.jpg" : @"chicken.jpg"];
	UIImage *image = [UIImage imageNamed:(onGoat) ? @"2012.jpeg" : @"2013.jpeg"];
	
	[SLColorArt processImage:image
				scaledToSize:self.imageView.frame.size
				   threshold:2
				  onComplete:^(SLColorArt *colorArt) {
					  [UIView animateWithDuration:1
									   animations:^{
										   self.view.backgroundColor = colorArt.backgroundColor;
									   }];
					  
					  self.primary.textColor = colorArt.primaryColor;
					  self.secondary.textColor = colorArt.secondaryColor;
					  self.detail.textColor = colorArt.detailColor;
				  }];
	
	[self.imageView setImage:image];
}

@end
