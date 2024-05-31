//
//  GameState1.m
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameState1.h"
#import "Board1.h"


@implementation GameState1

@synthesize m_Board;
@synthesize m_currentShapeGroupId;
@synthesize m_currentShapeGroupRotationState;
@synthesize m_piecePreviewShapeGroupId;
@synthesize m_currentShapeLeft;
@synthesize m_currentShapeTop;
@synthesize m_bPieceActive;
@synthesize m_score;

-(void)setBoard:(NSMutableArray*) board rows:(int)r cols:(int)c
{
	Board1 *aBoard = [[Board1 alloc] init:r columnsPerRow:c];
	self.m_Board = aBoard;
	[aBoard release];
	
	for(int i = 0; i < r; ++i)
	{
		for(int j = 0; j < c; ++j)
		{
			printf("%d ", [[board objectAtIndex: (i * c + j)] intValue]);
			[m_Board setElementAt:i column:j value:[[board objectAtIndex: (i * c + j)] intValue]];
		}
		printf("\n");
	}
}

@end
