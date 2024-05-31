//
//  MainView.m
//  Tetris
//

#import "MainView.h"
#import "Tetris2AppDelegate.h"

@implementation MainView

@synthesize theLabel;


- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		// Initialization code
		Tetris2AppDelegate *mainDelegate = (Tetris2AppDelegate *)[[UIApplication sharedApplication] delegate];
		theLabel.textColor = mainDelegate.textColor;
	}
	return self;
}


- (void)drawRect:(CGRect)rect {
	// Drawing code
}


- (IBAction)tellDelegateToFlipViews:(id)sender
{
	Tetris2AppDelegate *mainDelegate = (Tetris2AppDelegate *)[[UIApplication sharedApplication] delegate];
	[mainDelegate pauseGame];
	[mainDelegate flipToSettings];
}


- (void)dealloc {
	[theLabel release];
	[super dealloc];
}


@end
