//
//  TetrisViewController1.m
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TetrisViewController1.h"
#import "Board1.h"
#import "SoundEffect.h"
#import "Tetris1.h"
#import "GameState1.h"
#import "Shape1.h"
#import "ShapeGroup1.h"
#import "Tetris2AppDelegate.h"

@implementation TetrisViewController1

@synthesize m_savedGameState, theLabel, m_updateTime, m_Tetris;
@synthesize mainBundle, m_tickSound;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
		mainBundle = [NSBundle mainBundle];
		SoundEffect* aSoundEffect = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"tap" ofType:@"aif"]];
		m_tickSound = aSoundEffect;
		[aSoundEffect release];
	}
	return self;
}


/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	printf("TetrisViewContr.viewDidLoad()\n");
    [super viewDidLoad];
	
	ShapeGroup1* grp1 = [ShapeGroup1 getPredefinedShapeGroup: [ShapeGroup1 SHAPE_LEFT_L]];
	ShapeGroup1* grp2 = [ShapeGroup1 getPredefinedShapeGroup: [ShapeGroup1 SHAPE_RIGHT_L]];
	ShapeGroup1* grp3 = [ShapeGroup1 getPredefinedShapeGroup: [ShapeGroup1 SHAPE_T]];
	ShapeGroup1* grp4 = [ShapeGroup1 getPredefinedShapeGroup: [ShapeGroup1 SHAPE_LINE]];
	ShapeGroup1* grp5 = [ShapeGroup1 getPredefinedShapeGroup: [ShapeGroup1 SHAPE_LEFT_Z]];
	ShapeGroup1* grp6 = [ShapeGroup1 getPredefinedShapeGroup: [ShapeGroup1 SHAPE_RIGHT_Z]];
	ShapeGroup1* grp7 = [ShapeGroup1 getPredefinedShapeGroup: [ShapeGroup1 SHAPE_SQUARE]];
	
	NSMutableArray *groups = [NSMutableArray arrayWithObjects: grp1, grp2, grp3, grp4, grp5, grp6, grp7, nil];
	
	Tetris1 *aTetris = [[Tetris1 alloc] init:10 heightOfBoard:15 listOfShapes: groups];
	self.m_Tetris = aTetris;
	[aTetris release];
	[m_Tetris setM_VCParent:self];
	//---------------------------------------------------
	self.m_savedGameState = [NSMutableArray array];
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *appDefaults = [NSDictionary dictionaryWithObject:m_savedGameState forKey:@"gameState"];
    [defaults registerDefaults:appDefaults];
	
	NSMutableArray* savedGameState = [[NSUserDefaults standardUserDefaults] objectForKey:@"gameState"];
	
	GameState1* retrievedState = [[GameState1 alloc] init];
	
	if(nil != savedGameState && 8 == [savedGameState count])
	{
		printf("count = %d\n", [savedGameState count]);
		NSMutableArray* val1 = [savedGameState objectAtIndex:0];
		int val2 = [[savedGameState objectAtIndex:1] intValue];
		int val3 = [[savedGameState objectAtIndex:2] intValue];
		int val4 = [[savedGameState objectAtIndex:3] intValue];
		int val5 = [[savedGameState objectAtIndex:4] intValue];
		int val6 = [[savedGameState objectAtIndex:5] intValue];
		int val7 = [[savedGameState objectAtIndex:6] intValue];
		int val8 = [[savedGameState objectAtIndex:7] intValue];
		
		printf("curId = %d\n", val2);
		printf("curRotState = %d\n", val3);
		printf("curLeft = %d\n", val4);
		printf("curTop = %d\n", val5);
		printf("curScore = %d\n", val6);
		printf("prevId = %d\n", val7);
		printf("isPieceActive = %d\n", val8);
		
		[retrievedState setBoard:val1 rows:15 cols:10];
		[retrievedState setM_currentShapeGroupId:val2];
		[retrievedState setM_currentShapeGroupRotationState:val3];
		[retrievedState setM_currentShapeLeft:val4];
		[retrievedState setM_currentShapeTop:val5];
		[retrievedState setM_score:val6];
		[retrievedState setM_piecePreviewShapeGroupId:val7];
		[retrievedState setM_bPieceActive:val8];
		
		[m_Tetris reviveSavedGame:retrievedState];
		
		m_updateTime = 0.6f;
	}
	[retrievedState release];
	
	[m_Tetris updateBoard];
	[self updateBoardDisplay];
	
	//	m_timer = [NSTimer scheduledTimerWithTimeInterval: m_updateTime target: self selector:
	//	@selector(handleTimer:) userInfo: nil repeats: YES];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[m_tickSound release];
	[m_Tetris release];
	[m_savedGameState release];
    [super dealloc];
}

-(IBAction) arrowPressed:(id)sender
{
	int tag = [sender tag];
	BOOL bValid = FALSE;
	//	printf("tag: %d\n" + tag);
	switch (tag) {
		case 100001:
			//			printf("arrowPressed(): UP\n");
			[m_Tetris rotateShape];
			bValid = TRUE;
			break;
		case 100002:
			//			printf("arrowPressed(): RIGHT\n");
			[m_Tetris moveRight];
			bValid = TRUE;
			break;
		case 100003:
			//			printf("arrowPressed(): DOWN\n");
			[m_Tetris moveDownToEnd];
			bValid = TRUE;
			break;
		case 100004:
			//			printf("arrowPressed(): LEFT\n");
			[m_Tetris moveLeft];
			bValid = TRUE;
			break;
		default:
			break;
	}
	
	if(bValid)
	{
		//		printf("arrowPressed: call updateDisplay()\n");
		[self updateBoardDisplay];
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	m_bTouchMoved = FALSE;
	m_bMovedLeftRight = FALSE;
	m_bDownDone = FALSE;
	m_bFirst = TRUE;
	dirString = 0;
	UITouch *touch = [touches anyObject];
	m_lastPoint = [touch locationInView:[self view]];
	m_numTaps = [touch tapCount];
	
	m_bValidTouch = FALSE;
	// only allow touches that lie on the black playground area
	if(m_lastPoint.x < 250 && m_lastPoint.y < 375)
	{
		m_bValidTouch = TRUE;
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(m_bValidTouch)
	{
		m_bTouchMoved = TRUE;
		UITouch *touch = touches.anyObject;
		CGPoint currentTouchPosition = [touch locationInView:[self view]];
		
		int diffX = (int) fabsf(m_lastPoint.x - currentTouchPosition.x);
		int diffY = (int) fabsf(m_lastPoint.y - currentTouchPosition.y);
		
		// more horizontal than vertical
		if (diffX >= HORIZ_SWIPE_DRAG_MIN && diffX >= diffY)
		{
			// Horizontal Swipe
			if (m_lastPoint.x < currentTouchPosition.x)
			{
				// swipe: left to right
				dirString = DIRECTION_RIGHT;
			}
			else
			{
				// swipe: right to left
				dirString = DIRECTION_LEFT;
			}
			
			// TODO: [(TetrisAppDelegate*)[[UIApplication sharedApplication] delegate] getTileImageSize];
			// 25 = current tile image width
			// change this magic number with a method call or const
			//int n = diffX / 25;
			int m = 0;
			if(m_bFirst)
			{
				//				printf("first touch: m = %d, ", diffX / 25);
				m = diffX / 25;
				m_sumMoved = 0;
				//				printf("diff = %d, numMoves = %d\n", diffX, m_bFirst ? (m < 1 ? 1 : m) : m);
				m_bValidMove = TRUE;
			}
			else
			{
				//				printf("sum: old = %d, ", m_sumMoved);
				m_sumMoved += diffX;
				m = m_sumMoved / 25;
				if(m > 1)
				{
					m_sumMoved = 0;
				}
				m_bValidMove = TRUE;
				//				printf("new = %d, ", m_sumMoved);
				//				printf(" diff = %d, numMoves = %d\n", diffX, m_bFirst ? (m < 1 ? 1 : m) : m);
			}
			
			m_numMoves = m_bFirst ? (m < 1 ? 1 : m) : m;
			m_bFirst = FALSE;
		}
		// more vertical than horizontal
		else if (diffY >= VERT_SWIPE_DRAG_MIN && diffY >= diffX)
		{
			// Vertical Swipe
			if (m_lastPoint.y < currentTouchPosition.y)
			{
				// swipe: top to bottom
				dirString = DIRECTION_DOWN;
				
				// only allow continuous swipe after left/right movement
				// if the down swipe continues long enough
				if(m_bMovedLeftRight && diffY >= VERT_SWIPE_DRAG_MIN * 2)
				{
					m_bAllowDown = TRUE;
				}
			}
			else
			{
				// swipe: bottom to top
				dirString = DIRECTION_UP;
			}
			m_bValidMove = TRUE;
		}
		
		if(m_bValidMove)
		{
			switch (dirString) {
				case DIRECTION_LEFT:
					m_bMovedLeftRight = TRUE;
					for (int i = 0; i < m_numMoves; ++i)
					{
						//					printf("moveLeft: %d\n", i + 1);
						[m_Tetris moveLeft];
						[self updateBoardDisplay];
						m_sumMoved = 0;
					}
					m_bValidMove = FALSE;
					break;
				case DIRECTION_RIGHT:
					m_bMovedLeftRight = TRUE;
					for (int i = 0; i < m_numMoves; ++i)
					{
						//					printf("moveRight: %d\n", i + 1);
						[m_Tetris moveRight];
						[self updateBoardDisplay];
						m_sumMoved = 0;
					}
					m_bValidMove = FALSE;
					break;			
				case DIRECTION_UP:
					// for a touch_began-end cycle allow only one up movement.
					// for the move_up action won't affect successive pieces.
					if(!m_bRotated && !m_bMovedLeftRight)
					{
						[m_Tetris rotateShape];
						[self updateBoardDisplay];
						m_bRotated = TRUE;
					}
					m_sumMoved = 0;
					break;
				case DIRECTION_DOWN:
					// for a touch_began-end cycle allow only one down movement.
					// for the move_down action won't affect successive pieces.
					if(!m_bDownDone && (!m_bMovedLeftRight || m_bAllowDown))
					{
						[m_Tetris moveDownToEnd];
						[self updateBoardDisplay];
						m_bDownDone = TRUE;
						m_bAllowDown = FALSE;
					}
					m_sumMoved = 0;
					break;
				default:
					break;
			}
		}
		m_lastPoint = currentTouchPosition;
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(m_bValidTouch)
	{
		if(!m_bTouchMoved)
		{
			for(int i = 0; i < m_numTaps; ++i)
			{
				[m_Tetris rotateShape];
				[self updateBoardDisplay];
			}
		}
		m_bRotated = FALSE;
		m_bMovedLeftRight = FALSE;
	}
}

-(void)handleTimer: (NSTimer *) timer
{
	if(m_timer == timer)
	{
		//printf("handleTimer(): update and display\n");
		BOOL bGameActive = [m_Tetris updateBoard];
		
		[self updateBoardDisplay];
		
		if(!bGameActive)
		{
			//			printf("Game Over\n");
			[m_timer invalidate];
			[self _showAlert:@"That's it..."];
		}
	}
}


-(void)updateBoardDisplay
{
	printf("updateBoardDisplay() start\n");
	Board1* gameBoard = [m_Tetris getBoard];
	printf("updateBoardDisplay() pass1\n");
    int rows = [gameBoard m_row];
	int cols = [gameBoard m_col];
	[((Tetris2AppDelegate*)[[UIApplication sharedApplication] delegate]) setDisplayScore:[m_Tetris getScore]];
	printf("updateBoardDisplay() pass2\n");
    
	Shape1* previewShape = [m_Tetris getPreviewShape];
	int previewShapeLen = [previewShape getLength];
    printf("updateBoardDisplay() pass3\n");
	[((Tetris2AppDelegate*)[[UIApplication sharedApplication] delegate]) setPreview:previewShape rows:previewShapeLen columns:previewShapeLen];
    printf("updateBoardDisplay() pass4\n");
	[((Tetris2AppDelegate*)[[UIApplication sharedApplication] delegate]) setDisplayBoard:gameBoard rows:rows columns:cols];
    
    printf("updateBoardDisplay() end\n");
}

-(void)_showAlert:(NSString*)title
{
	NSString *str1 = @"Score: ";
	NSString *msgString = [str1 stringByAppendingString: [[NSNumber numberWithInt:[m_Tetris getScore]] stringValue]];
	UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title message:msgString  delegate:self cancelButtonTitle:@"Start New Game" otherButtonTitles:nil];
	[alertView show];
}

-(void)modalViewCancel:(UIAlertView *)alertView
{
    [alertView release];
}

-(void)modalView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != -1) {
		[self resetAll];
    }
    [alertView release];
}

-(void)resetAll
{
	printf("resetAll()\n");
	[m_Tetris resetGame];
	[self updateBoardDisplay];
	[self updateDefaults];
	m_timer = [NSTimer scheduledTimerWithTimeInterval: m_updateTime target: self selector:
			   @selector(handleTimer:) userInfo: nil repeats: YES];
}

-(void)updateDefaults
{
	//	printf("updateDefaults()\n");
	
	Board1* main = [m_Tetris getBoard];
	int rows = [[m_Tetris getBoard] m_row];
	int cols = [[m_Tetris getBoard] m_col];
	
	NSMutableArray* tempBoard = [[NSMutableArray alloc] init];
	
	for(int i = 0; i < rows; ++i)
	{
		for(int j = 0; j < cols; ++j)
		{
			//printf("%d ", [main getElementAt:i column:j]);
			[tempBoard addObject:[NSNumber numberWithInteger:[main getElementAt:i column:j]]];
		}
		//printf("\n");
	}
	
	int curId = [m_Tetris getCurrentShapeGroupId];
	int curRotationState = [m_Tetris getCurrentShapeGroupRotationState];
	int curLeft = [m_Tetris m_currentShapeLeft];
	int curTop = [m_Tetris m_currentShapeTop];
	int curScore = [m_Tetris m_score];
	int previewId = [m_Tetris getPreviewId];
	int isPieceActive = [m_Tetris m_bPieceActive];
	
	NSMutableArray *aSavedGameState = [[NSMutableArray alloc] initWithCapacity:0];
	self.m_savedGameState = aSavedGameState;
	[aSavedGameState release];
	[m_savedGameState addObject:tempBoard];
	[m_savedGameState addObject:[NSNumber numberWithInteger: curId]];
	[m_savedGameState addObject:[NSNumber numberWithInteger: curRotationState]];
	[m_savedGameState addObject:[NSNumber numberWithInteger: curLeft]];
	[m_savedGameState addObject:[NSNumber numberWithInteger: curTop]];
	[m_savedGameState addObject:[NSNumber numberWithInteger: curScore]];
	[m_savedGameState addObject:[NSNumber numberWithInteger: previewId]];
	[m_savedGameState addObject:[NSNumber numberWithInteger: isPieceActive]];
	
	//	[m_savedGameState addObject:[NSDictionary dictionaryWithObject:gameState forKey:@"gameState"]];
	
	[[NSUserDefaults standardUserDefaults] setObject:m_savedGameState forKey:@"gameState"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	[tempBoard release];
}

-(void)pauseTetris
{
	[m_timer invalidate];
}

-(void)resumeTetris
{
	m_timer = [NSTimer scheduledTimerWithTimeInterval: m_updateTime target: self selector:
			   @selector(handleTimer:) userInfo: nil repeats: YES];
}


-(void)setUpdateTimer: (float) newTime
{
	m_updateTime = newTime;
}

- (float) getUpdateTime
{
	return m_updateTime;
}

-(void)playTickSound
{
	NSLog(@"%d", [m_tickSound retainCount]);
	
	[m_tickSound play];
	
	NSLog(@"%d", [m_tickSound retainCount]);
}

@end
