//
//  Tetris2AppDelegate.m
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Tetris2AppDelegate.h"
#import "TetrisViewController1.h"
#import "SettingsViewController1.h"
#import "SplashViewController.h"
#import "Board1.h"
#import "Shape1.h"

@implementation Tetris2AppDelegate

@synthesize window;
@synthesize viewController;
@synthesize boardView;
@synthesize scoreView;
@synthesize previewView;
@synthesize splashViewController;
@synthesize settingsViewController;
@synthesize textColor;
@synthesize m_lblScore;

@synthesize m_slotImage, m_previewImage, m_arrImages, m_arrPreviewImages;


- (id) init
{
	if(self = [super init])
	{
		printf("init()\n");
		
		UIView *aView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 375)];
		self.boardView = aView1;
		[aView1 release];
		
		NSMutableArray *aMutableArray = [[NSMutableArray alloc] initWithCapacity:0];
		self.m_arrImages = aMutableArray;
		[aMutableArray release];
		
		[m_arrImages addObject:[UIImage imageNamed:@"tileDefault_25x25.png"]];
		[m_arrImages addObject:[UIImage imageNamed:@"tileCayenne_25x25.png"]];
		[m_arrImages addObject:[UIImage imageNamed:@"tilePlum_25x25.png"]];
		[m_arrImages addObject:[UIImage imageNamed:@"tileBlue_25x25.png"]];
		[m_arrImages addObject:[UIImage imageNamed:@"tileLemon_25x25.png"]];
		[m_arrImages addObject:[UIImage imageNamed:@"tileGreen_25x25.png"]];
		[m_arrImages addObject:[UIImage imageNamed:@"tileIron_25x25.png"]];
		[m_arrImages addObject:[UIImage imageNamed:@"tileSky_25x25.png"]];
		
		aMutableArray = [[NSMutableArray alloc] initWithCapacity:0];
		self.m_arrPreviewImages = aMutableArray;
		[aMutableArray release];
		[m_arrPreviewImages addObject:[UIImage imageNamed:@"tileDefault_14x14.png"]];
		[m_arrPreviewImages addObject:[UIImage imageNamed:@"tileCayenne_14x14.png"]];
		[m_arrPreviewImages addObject:[UIImage imageNamed:@"tilePlum_14x14.png"]];
		[m_arrPreviewImages addObject:[UIImage imageNamed:@"tileBlue_14x14.png"]];
		[m_arrPreviewImages addObject:[UIImage imageNamed:@"tileLemon_14x14.png"]];
		[m_arrPreviewImages addObject:[UIImage imageNamed:@"tileGreen_14x14.png"]];
		[m_arrPreviewImages addObject:[UIImage imageNamed:@"tileIron_14x14.png"]];
		[m_arrPreviewImages addObject:[UIImage imageNamed:@"tileSky_14x14.png"]];
		
		UIImage *defaultImage25_25 = [UIImage imageNamed:@"tileDefault_25x25.png"];
		
		aMutableArray = [[NSMutableArray alloc] initWithCapacity:0];
		self.m_slotImage =  aMutableArray;
		[aMutableArray release];
		
		for(int i = 0; i < 15; ++i)
		{
			for(int j = 0; j < 10; ++j)
			{
				UIImageView* imgView = [[UIImageView alloc] initWithFrame:CGRectMake(25 * j, 25 * i, 25, 25)];
				imgView.image = defaultImage25_25;
				[m_slotImage addObject: imgView];
				[self.boardView addSubview:imgView];
				[imgView release];
			}
		}
		
		UIView *aView2 = [[UIView alloc] initWithFrame:CGRectMake(257, 106, 56, 56)];
		self.previewView = aView2;
		[aView2 release];
		
		UIImage *defaultImage14_14 = [UIImage imageNamed:@"tileDefault_14x14.png"];
		
		aMutableArray = [[NSMutableArray alloc] initWithCapacity:0];
		self.m_previewImage =  aMutableArray;
		[aMutableArray release];
		
		for(int i = 0; i < 4; ++i)
		{
			for(int j = 0; j < 4; ++j)
			{
				UIImageView* imgView = [[UIImageView alloc] initWithFrame:CGRectMake(257 + 14 * j, 106 + 14 * i, 14, 14)];
				imgView.image = defaultImage14_14;
				[m_previewImage addObject:imgView];
				[boardView addSubview:imgView];
				[imgView release];
			}
		}
	}
	return self;
}

-(void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch
	
	UIView *aView3 = [[UIView alloc] initWithFrame:CGRectMake(251.0f, 40.0f, 66.0f, 31.0f)];
	self.scoreView = aView3;
	[aView3 release];
	
	UILabel *aLabel1 = [[UILabel alloc] initWithFrame:scoreView.bounds];
	self.m_lblScore = aLabel1;
	[aLabel1 release];
	[m_lblScore setBackgroundColor:[UIColor blueColor]];
	[m_lblScore setTextAlignment:NSTextAlignmentRight];
	[m_lblScore setText:@"0"];
	
	[scoreView addSubview:m_lblScore];
	[m_lblScore release];
	
	TetrisViewController1 *aTetrisVC = [[TetrisViewController1 alloc] initWithNibName:@"TetrisViewController1" bundle:nil];
	self.viewController = aTetrisVC;
	[aTetrisVC release];
	
	[viewController.view addSubview:previewView];
	
	[viewController.view addSubview:boardView];
	[viewController.view addSubview:scoreView];
	
	//	[window addSubview:viewController.view];
	
	SplashViewController *splashVC = [[SplashViewController alloc] initWithNibName:@"SplashView" bundle:nil];
	self.splashViewController = splashVC;
	[splashVC release];
	
	[window addSubview:[splashViewController view]];
	
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application
{
	[self.viewController updateDefaults];
}

- (void)dealloc {
	for(int i = 0; i < 8; ++i)
	{
		[[m_arrImages objectAtIndex:i] release];
		[[m_arrPreviewImages objectAtIndex:i] release];
	}
	[boardView release];
	[scoreView release];
	[previewView release];
    [viewController release];
    [window release];
    [super dealloc];
}

-(void)setDisplayBoard:(Board1*) board rows:(int) r columns:(int) c
{
	for(int i = 0; i < r; ++i)
	{
		for(int j = 0; j < c; ++j)
		{
            int nImage = [board getElementAt:i column:j];
            if(-1 != nImage)
            {
                ((UIImageView *)[m_slotImage objectAtIndex:(i * c + j)]).image = [m_arrImages objectAtIndex:nImage];
            }
		}
	}
}

-(void)setPreview:(Shape1*) preivewShape rows:(int) r columns:(int) c
{
	for(int i = 0; i < 4; ++i)
	{
		for(int j = 0; j < 4; ++j)
		{
			((UIImageView *)[m_previewImage objectAtIndex:(i * 4 + j)]).image = [m_arrPreviewImages objectAtIndex:0];
		}
	}
	for(int i = 0; i < r; ++i)
	{
		for(int j = 0; j < c; ++j)
		{
			((UIImageView *)[m_previewImage objectAtIndex:(i * c + j)]).image = [m_arrPreviewImages objectAtIndex:[preivewShape getElementAt:i column:j]];
		}
	}	
}

-(void)setDisplayScore:(int) newScore
{
    NSString *strScore = [NSString stringWithFormat:@"%d", newScore];
	[m_lblScore setText:strScore];
}


- (void)flipToGame {
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:window cache:NO];
	[splashViewController.view removeFromSuperview];
	[self.window addSubview:[viewController view]];
	[UIView commitAnimations];
	[splashViewController release];
	splashViewController = nil;
}

- (void)flipToSettings {
	SettingsViewController1 *aSettingsVC = [[SettingsViewController1 alloc] initWithNibName:@"SettingsView" bundle:nil];
	[self setSettingsViewController:aSettingsVC];
	[aSettingsVC release];
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:window cache:YES];
	[viewController.view removeFromSuperview];
	[self.window addSubview:[settingsViewController view]];
	[UIView commitAnimations];
}

- (void)flipToMain {
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:window cache:NO];
	[settingsViewController.view removeFromSuperview];
	[self.window addSubview:[viewController view]];
	[UIView commitAnimations];
	[settingsViewController release];
	settingsViewController = nil;
}


-(void)startGame
{
	[viewController resumeTetris];
}


-(void)pauseGame
{
	[viewController pauseTetris];
}

-(void)updateTimer: (float) newTime
{
	[viewController setUpdateTimer:newTime];
}

- (float) getUpdateTimerValue
{
	return [viewController getUpdateTime];
}

@end
