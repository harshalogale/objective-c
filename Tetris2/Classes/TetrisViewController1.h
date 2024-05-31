//
//  TetrisViewController1.h
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SoundEffect, Tetris1, Tetris2AppDelegate;

@interface TetrisViewController1 : UIViewController
{
	Tetris1 *m_Tetris;
	NSTimer *m_timer;
	NSMutableArray *m_savedGameState;
	IBOutlet UILabel *theLabel;
	
	/**
	 * New piece generation time. Game speed.
	 */
	float m_updateTime;
	
	//	CGPoint startTouchPosition;
	int dirString;
	int m_numMoves;
	
	CGPoint m_lastPoint;
	BOOL m_bTouchMoved;
	int m_numTaps;
	BOOL m_bDownDone;
	BOOL m_bRotated;
	BOOL m_bMovedLeftRight;
	BOOL m_bValidTouch;
	BOOL m_bFirst;
	BOOL m_bValidMove;
	BOOL m_bAllowDown;
	int m_sumMoved;
	
	NSBundle *mainBundle;
	SoundEffect* m_tickSound;
}

@property (nonatomic, assign) NSBundle *mainBundle;
@property (nonatomic, retain) SoundEffect* m_tickSound;

@property (nonatomic, retain) Tetris1 *m_Tetris;
@property (nonatomic, retain) NSMutableArray* m_savedGameState;
@property (nonatomic, retain) UILabel *theLabel;
@property float m_updateTime;

- (IBAction) arrowPressed:(id)sender;
-(void)setUpdateTimer: (float) newTime;
- (float) getUpdateTime;

-(void)handleTimer: (NSTimer *) timer;

-(void)updateBoardDisplay;

-(void)_showAlert:(NSString*)title;

-(void)resetAll;

-(void)updateDefaults;

-(void)pauseTetris;

-(void)resumeTetris;

-(void)playTickSound;

enum {
	DIRECTION_LEFT = 1,
	DIRECTION_RIGHT = 2,
	DIRECTION_UP = 3,
	DIRECTION_DOWN = 4
};

enum {
	HORIZ_SWIPE_DRAG_MIN = 8,
	VERT_SWIPE_DRAG_MIN = 8
};

@end

