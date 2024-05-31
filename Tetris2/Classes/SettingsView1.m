//
//  SettingsView1.m
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SettingsView1.h"
#import "Tetris2AppDelegate.h"


@implementation SettingsView1

@synthesize myShinyButton;

- init
{
	if(self = [super init])
	{
		printf("SettingsView init()\n");	
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		
		Tetris2AppDelegate *mainDelegate = (Tetris2AppDelegate *)[[UIApplication sharedApplication] delegate];
		
		UISlider* speedSlider = (UISlider*) [self viewWithTag:20001];
		float val = [mainDelegate getUpdateTimerValue];
		printf("init settings view: set slider = %f\n", ((val < 0.2 || val > 1.2) ? 0.6 : val));
		speedSlider.value = ((val < 0.2 || val > 1.2) ? 0.6 : val);
		
		myShinyButton.tintColor = [UIColor colorWithRed:255.0/255.0 green:15.0/255.0 blue:15.0/255.0 alpha:1.0];
	}
	return self;
}

- (void)drawRect:(CGRect)rect {
	// Drawing code
}

- (IBAction)backToGame:(id)sender
{
	printf("SettingsView.backToGame(): flipToMain");
	Tetris2AppDelegate *mainDelegate = (Tetris2AppDelegate *)[[UIApplication sharedApplication] delegate];
	[mainDelegate flipToMain];
	[mainDelegate startGame];
}

- (IBAction) sliderMoved: (id) sender
{
	Tetris2AppDelegate *mainDelegate = (Tetris2AppDelegate *)[[UIApplication sharedApplication] delegate];
	
	UISlider* slider = (UISlider *)sender;
	float val = 0 - [slider value];
	//NSLog([NSString stringWithFormat:@"%f, %f, %f", [slider value], [slider minimumValue], [slider maximumValue]]);
	[mainDelegate updateTimer: val];
}

-(void)setSliderValue: (float) newValue
{
	//NSLog(@"newValue = %f", newValue);
	[((UISlider *)[self viewWithTag:20001]) setValue:(0 - newValue) animated:YES];
}

- (void)dealloc {
	[super dealloc];
}


@end
