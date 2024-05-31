//
//  SettingsViewController1.m
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController1.h"
#import "Tetris2AppDelegate.h"
#import "SettingsView1.h"

static const int TAG_SETINGS_VIEW = 6000;
static const int TAG_SETINGS_VIEW_SLIDER = 20001;

@implementation SettingsViewController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		//		UIView* settingsView = [[self view] viewWithTag:TAG_SETINGS_VIEW];
		//		UISlider* slTimer = [settingsView viewWithTag: TAG_SETINGS_VIEW_SLIDER];
		//		slTimer.value = 
	}
	return self;
}

// If you need to do additional setup after loading the view, override viewDidLoad.
- (void)viewDidLoad
{
	//NSLog(@"settings viewDidLoad");
	Tetris2AppDelegate *mainDelegate = (Tetris2AppDelegate *)[[UIApplication sharedApplication] delegate];
	float val = [mainDelegate getUpdateTimerValue];
	
	[((SettingsView1 *) [[self view] viewWithTag:6000]) setSliderValue:val];	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}

- (void)dealloc {
	[super dealloc];
}

@end
