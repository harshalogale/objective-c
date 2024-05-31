//
//  SplashView1.m
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SplashView1.h"
#import "Tetris2AppDelegate.h"

@implementation SplashView1


- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		
	}
	return self;
}


- (void)drawRect:(CGRect)rect {
	// Drawing code
}


- (IBAction) tellDelegateToFlipViews:(id)sender {
	//	printf("SplashView.flipToGame\n");
	Tetris2AppDelegate *mainDelegate = (Tetris2AppDelegate *)[[UIApplication sharedApplication] delegate];
	[mainDelegate flipToGame];
	[mainDelegate startGame];
}


- (void)dealloc {
	[super dealloc];
}


@end
