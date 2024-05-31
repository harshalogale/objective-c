//
//  Tetris1.m
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Tetris1.h"
#import "Board1.h"
#import "Shape1.h"
#import "ShapeGroup1.h"
#import "GameState1.h"
//#import "TetrisViewController1.h"

@implementation Tetris1

@synthesize m_Board, m_ShapeGroups;
@synthesize m_currentShapeLeft, m_currentShapeTop, m_bPieceActive, m_score;
@synthesize m_currentShapeGroup, m_piecePreviewShapeGroup;
//@synthesize m_VCParent;

- (id) init:(int)width heightOfBoard:(int) height listOfShapes:(NSMutableArray *) listShapes
{
	if(self = [super init])
	{
		m_width = width;
		m_height = height;
		m_currentShapeLeft = m_width / 2;
		m_currentShapeTop = 0;
		
		Board1 *aBoard = [[Board1 alloc] init:height columnsPerRow:width];
		self.m_Board = aBoard;
		[aBoard release];
		
		m_ShapeGroups = [[NSMutableArray alloc] initWithCapacity:0];
		
		for(int i = 0; i < 7; ++i)
		{
			ShapeGroup1* abc = [listShapes objectAtIndex:i];
			[m_ShapeGroups insertObject:abc atIndex:i];
		}
		
		m_piecePreviewShapeGroup = [self getRandomAvailableShape];
		m_currentShapeGroup = [self getRandomAvailableShape];
	}
	
	return self;
}

/**
 * Removes the current piece from the game board. Complements {@link #restorePiece()}.
 */
-(void)removePiece
{
	int len = [[m_currentShapeGroup  getCurrentShape] getLength];
	
	// blank out the shape from the boardGrid before checking for rotation
	for(int i = 0; i < len; ++i)
	{
		for(int j = 0; j < len; ++j)
		{
			if([[m_currentShapeGroup  getCurrentShape] getElementAt:i column:j] > 0)
			{
				[m_Board setElementAt:m_currentShapeTop + i column:m_currentShapeLeft + j value: 0];
			}
		}
	}
}


/**
 * Returns the game Board object.
 */
- (Board1*) getBoard
{
	return m_Board;
}


/**
 * Restores the current piece on the game board. Complements {@link #removePiece()}.
 */
-(void)restorePiece
{
	int len = [[m_currentShapeGroup  getCurrentShape] getLength];
	
	// blank out the shape from the boardGrid before checking for rotation
	for(int i = 0; i < len; ++i)
	{
		for(int j = 0; j < len; ++j)
		{
			if([[m_currentShapeGroup  getCurrentShape] getElementAt:i column:j] > 0)
			{
				[m_Board setElementAt:m_currentShapeTop + i column:m_currentShapeLeft + j value:[[m_currentShapeGroup  getCurrentShape] getElementAt:i column:j]];
			}
		}
	}
}

/**
 * @return <code>true</code> if the current piece can be moved down one slot, <code>false</code> otherwise
 */
- (BOOL) canMoveDown
{
	int len = [[m_currentShapeGroup  getCurrentShape] getLength];
	
	// blank out the shape from the boardGrid before checking for movement
	[self removePiece];
	
	//	for(int i = 0; i < len; ++i)
	//	{
	//		for(int j = 0; j < len; ++j)
	//		{
	//			printf("%d ", [[m_currentShapeGroup  getCurrentShape] getElementAt:i column:j]);
	//		}
	//		printf("\n");
	//	}
	
	for(int i = 0; i < len; ++i)
	{
		for(int j = 0; j < len; ++j)
		{
			//printf("%d ", [m_Board getElementAt:m_currentShapeTop + i + 1 column:m_currentShapeLeft + j]);
			int slotVal = [[m_currentShapeGroup  getCurrentShape] getElementAt:i column:j];
			if(slotVal > 0 && ( ![self checkBounds:m_currentShapeLeft + j yCoord:m_currentShapeTop + i + 1] || 
							   [m_Board getElementAt:m_currentShapeTop + i + 1 column:m_currentShapeLeft + j] > 0))
			{
				// cannot move the piece,
				// restore the shape at it's original position on the boardGrid
				[self restorePiece];
				m_bPieceActive = FALSE;
				return false;
			}
		}
		//printf("\n");
	}
	
	return true;
}

/**
 * @return <code>true</code> if the current piece can be moved left one slot, <code>false</code> otherwise
 */
- (BOOL) canMoveLeft
{
	int len = [[m_currentShapeGroup  getCurrentShape] getLength];
	
	// blank out the shape from the boardGrid before checking for movement
	[self removePiece];
	
	for(int i = 0; i < len; ++i)
	{
		for(int j = 0; j < len; ++j)
		{
			int slotVal = [[m_currentShapeGroup  getCurrentShape] getElementAt:i column:j];
			int boardVal = [m_Board getElementAt:m_currentShapeTop + i column:m_currentShapeLeft + j - 1];
			if(slotVal > 0 && ( ![self checkBounds:m_currentShapeLeft + j - 1 yCoord:m_currentShapeTop + i] || boardVal > 0))
			{
				// cannot move the piece,
				// restore the shape at it's original position on the boardGrid
				[self restorePiece];
				return false;
			}
		}
	}
	return true;
}


/**
 * @return <code>true</code> if the current piece can be moved right one slot, <code>false</code> otherwise
 */
- (BOOL) canMoveRight
{
	int len = [[m_currentShapeGroup  getCurrentShape] getLength];
	
	// blank out the shape from the boardGrid before checking for movement
	[self removePiece];
	
	for(int i = 0; i < len; ++i)
	{
		for(int j = 0; j < len; ++j)
		{
			int slotVal = [[m_currentShapeGroup  getCurrentShape] getElementAt:i column:j];
			if(slotVal > 0 && ( ![self checkBounds: m_currentShapeLeft + j + 1 yCoord:m_currentShapeTop + i] || 
							   [m_Board getElementAt:m_currentShapeTop + i column:m_currentShapeLeft + j + 1] > 0))
			{
				// cannot move the piece,
				// restore the shape at it's original position on the boardGrid
				[self restorePiece];
				return false;
			}
		}
	}
	
	return true;
}

/**
 * @return <code>true</code> if the current piece can be rotated, <code>false</code> otherwise
 */
- (BOOL) canRotate
{
	Shape1* rotShape = [m_currentShapeGroup  getRotatedShape];
	int len = [rotShape getLength];
	
	// blank out the shape from the boardGrid before checking for rotation
	[self removePiece];
	
	for(int i = 0; i < len; ++i)
	{
		for(int j = 0; j < len; ++j)
		{
			int slotVal = [rotShape getElementAt:i column:j];
			//TODO: ******* check ******* this condition may have to be changed - because - the final rotated position may be free but still the piece may not be able to rotate
			// if this slot of the shape is filled and (either the slot lies outside the board or the board slot is filled) 
			if ( slotVal > 0 && ( ![self checkBounds:m_currentShapeLeft + j yCoord:m_currentShapeTop + i] || [m_Board getElementAt:m_currentShapeTop + i column:m_currentShapeLeft + j] > 0 ) )
			{
				// cannot rotate the piece,
				// restore the shape at it's original position on the boardGrid
				[self restorePiece];
				return false;
			}
		}
	}
	return true;
}

/**
 * Checks if the given point lies of the board.
 * @param x x coordinate of the point
 * @param y y coordinate of the point
 * @return <code>true</code> if the point lies on the board, <code>false</code> otherwise
 */
- (BOOL) checkBounds:(int) x yCoord: (int) y
{
	return (x >= 0 && x < m_width && y >= 0 && y < m_height);
}

/**
 * Check if any lines are complete and remove those lines from the board.
 */
-(void)removeCompletedLines
{
	BOOL bComplete = false;
	int nLinesCompleted = 0;
	int nTotLinesCompleted = 0;
	int scoreAdded = 0;
	
	// for each line on the board
	for(int i = 0; i < m_height; ++i)
	{
		bComplete = TRUE;
		
		// for each slot on the line 
		for(int j = 0; j < m_width; ++j)
		{
			// if the slot is filled
			if(!([m_Board getElementAt:i column:j] > 0))
			{
				bComplete = FALSE;
				break;
			}
		}
		
		// TODO: check if this 'if' block and the next 'if' block can be merged and 'continue' avoided.
		// if the line is complete, increment the completed lines counter
		if(bComplete)
		{
			++nLinesCompleted;
			
			int nColorPieces[7];
			for(int k = 0; k < 7; ++k)
			{
				nColorPieces[k] = 0;
			}
			
			// for each slot on the completed line
			for(int k = 0; k < m_width; ++k)
			{
				int elem = [m_Board getElementAt:i column:k];
				++nColorPieces[elem - 1];
			}
			
			for(int k = 0; k < 7; ++k)
			{
				scoreAdded += nColorPieces[k] * (nColorPieces[k] + 1) / 2;
			}
			
			
			// if this is not the last line then check the next line
			if((i + 1) < m_height)
			{
				continue;
			}
			else
			{
				++i;
			}
		}
		
		// if at least one line is complete
		if ( nLinesCompleted > 0 )
		{	
			//[m_VCParent playTickSound];
			nTotLinesCompleted += nLinesCompleted;
			// move the lines above it down by nLlinesCompleted positions
			for(int destLine = i - 1; destLine >= 0; --destLine)
			{
				int srcLine = destLine - nLinesCompleted;
				
				if ( srcLine < 0 )
				{
					// if the source location lies outside the board, simply mark the line empty
					for(int p = 0; p < m_width; ++p)
					{
						[m_Board setElementAt: destLine column: p value: 0];
					}
				}
				else
				{
					// it's a valid line on the board, so move it to the destination position
					for(int p = 0; p < m_width; ++p)
					{
						[m_Board setElementAt: destLine column: p value: [m_Board getElementAt:srcLine column: p]];
						[m_Board setElementAt: srcLine column: p value: 0]; // mark the source empty
					}
				}
			}
			
			nLinesCompleted = 0; // reset completed lines counter
		}
	}
	if(scoreAdded > 0)
	{
		scoreAdded = (nTotLinesCompleted * (nTotLinesCompleted + 1) / 2) * scoreAdded;
		[self setScore: [self getScore] + scoreAdded * 5];
	}
}

/**
 * Generates random partially filled lines and adds to the lower portion on the board.
 * @param nLinesToAdd Number of lines to be generated.
 * @return Number of lines successfully generated.
 */
-(int)generateRandomLines: (int) nLinesToAdd
{
	int nLinesAvailable = 0; // the actual number of lines that can be added
	
	for(int i = 0; i < nLinesToAdd; )
	{
		BOOL bFound = FALSE;
		for(int j = 0; j < m_width; ++j)
		{
			// if enough number of free lines are not available
			if( [m_Board getElementAt:i column:j] > 0)
			{
				bFound = FALSE;
				break;
			}
		}
		if(!bFound)
		{
			break;
		}
		nLinesAvailable = ++i;
	}
	
	// Move the current lines upwards by nLinesAdded (i.e, nLinesToAdd or less) positions.
	for(int j = 0; j < m_width; ++j)
	{
		for(int i = 0; i < (m_height - nLinesAvailable); ++i)
		{
			[m_Board setElementAt:i column:j value: [m_Board getElementAt: i + nLinesToAdd column:j]];
		}
	}
	
	// generate a random piece color to fill the slot with one of (0, 100, 200, ..., 700);
	int nextPiece = arc4random() % 8 * 100;
	
	// Add nLinesAdded randomly filled lines
	for(int i = 0; i < (m_height - nLinesAvailable); ++i)
	{
		for(int j = 0; j < m_width; ++j)
		{
			[m_Board setElementAt:i column:j value: nextPiece];
		}
	}
	return nLinesAvailable;
}

/**
 * 
 * @return A random shape from the list of basic shapes.
 */
- (ShapeGroup1 *) getRandomAvailableShape
{
	int nextShape = arc4random() % 7; // one of (0, ..., total number of groups);
	m_currentShapeLeft = m_width / 2 - [[[m_ShapeGroups objectAtIndex: nextShape] getCurrentShape] getLength] / 2;
	m_currentShapeTop = 0;
	[[m_ShapeGroups objectAtIndex:nextShape] resetRotation]; // before reusing the piece, remove any rotation change due to earlier actions
	return [m_ShapeGroups objectAtIndex: nextShape];
}

/**
 * Moves the current piece leftwards by one slot.
 */
-(void)moveLeft
{
	if(m_bPieceActive && [self canMoveLeft])
	{
		int len = [[m_currentShapeGroup getCurrentShape] getLength];
		
		// blank out the shape from the boardGrid before moving left
		[self removePiece];
		
		// place the shape on the game board one slot left
		for(int i = 0; i < len; ++i)
		{
			for(int j = 0; j < len; ++j)
			{
				if([[m_currentShapeGroup getCurrentShape] getElementAt:i column:j] > 0)
				{
					[m_Board setElementAt:m_currentShapeTop + i column:m_currentShapeLeft + j - 1 value: [[m_currentShapeGroup getCurrentShape] getElementAt:i column:j]];
				}
			}
		}
		
		// modify the (left, top) coordinate to denote the change in position
		--m_currentShapeLeft;
	}
}

/**
 * Moves the current piece rightwards by one slot.
 */
-(void)moveRight
{
	if(m_bPieceActive && [self canMoveRight])
	{
		int len = [[m_currentShapeGroup getCurrentShape] getLength];
		
		// blank out the shape from the boardGrid before moving left
		[self removePiece];
		
		// place the shape on the game board one slot left
		for(int i = 0; i < len; ++i)
		{
			for(int j = 0; j < len; ++j)
			{
				if([[m_currentShapeGroup getCurrentShape] getElementAt:i column:j] > 0)
				{
					[m_Board setElementAt:m_currentShapeTop + i column:m_currentShapeLeft + j + 1 value: [[m_currentShapeGroup getCurrentShape] getElementAt:i column:j]];
				}
			}
		}
		
		// modify the (left, top) coordinate to denote the change in position
		++m_currentShapeLeft;
	}
}

/**
 * Moves the current piece downwards by one slot.
 */
-(void)moveDown
{
	if([self canMoveDown])
	{
		int len = [[m_currentShapeGroup getCurrentShape] getLength];
		
		// blank out the shape from the boardGrid before moving left
		[self removePiece];
		
		// place the shape on the game board one slot left
		for(int i = 0; i < len; ++i)
		{
			for(int j = 0; j < len; ++j)
			{
				if([[m_currentShapeGroup getCurrentShape] getElementAt:i column:j] > 0)
				{
					[m_Board setElementAt:m_currentShapeTop + i + 1 column:m_currentShapeLeft + j value: [[m_currentShapeGroup getCurrentShape] getElementAt:i column:j]];
				}
			}
		}
		
		// modify the (left, top) coordinate to denote the change in position
		++m_currentShapeTop;
	}
}

/**
 * Moves the piece downwards until it touches either a filled slot or the bottom of the game board.
 */
-(void)moveDownToEnd
{
	BOOL bDown = FALSE;
	while([self canMoveDown])
	{
		if(!bDown)
		{
			bDown = TRUE;
		}
		[self moveDown];
	}
	[self setScore:[self getScore] + 5]; // 5 bonus points for fast game if down key used
}


/**
 * Rotate the shape once.
 */
-(void)rotateShape
{
	if(m_bPieceActive && [self canRotate])
	{
		Shape1* curShape = [m_currentShapeGroup  getCurrentShape];
		int len = [curShape getLength];
		
		// blank out the shape from the boardGrid before rotating
		[self removePiece];
		
		Shape1* rotatedShape = [m_currentShapeGroup getRotatedShape];
		
		// place the rotated shape on the game board
		for(int i = 0; i < len; ++i)
		{
			for(int j = 0; j < len; ++j)
			{
				if([rotatedShape getElementAt:i column:j] > 0)
				{
					[m_Board setElementAt:m_currentShapeTop + i column:m_currentShapeLeft + j value:[rotatedShape getElementAt:i column:j]];
				}
			}
		}
		
		// mark the shape as rotated
		[m_currentShapeGroup  markRotated];
	}
}

/////////////////////////////////////////////////

/**
 * Moves the current piece leftwards by one slot.
 */
-(void)moveLeft:(int)magnitude
{
	for(int i = 0; i < magnitude; ++i)
	{
		if(m_bPieceActive && [self canMoveLeft])
		{
			int len = [[m_currentShapeGroup getCurrentShape] getLength];
			
			// blank out the shape from the boardGrid before moving left
			[self removePiece];
			
			// place the shape on the game board one slot left
			for(int i = 0; i < len; ++i)
			{
				for(int j = 0; j < len; ++j)
				{
					if([[m_currentShapeGroup getCurrentShape] getElementAt:i column:j] > 0)
					{
						[m_Board setElementAt:m_currentShapeTop + i column:m_currentShapeLeft + j - 1 value: [[m_currentShapeGroup getCurrentShape] getElementAt:i column:j]];
					}
				}
			}
			
			// modify the (left, top) coordinate to denote the change in position
			--m_currentShapeLeft;
		}
	}
}

/**
 * Moves the current piece rightwards by one slot.
 */
-(void)moveRight:(int)magnitude
{
	for(int i = 0; i < magnitude; ++i)
	{
		if(m_bPieceActive && [self canMoveRight])
		{
			int len = [[m_currentShapeGroup getCurrentShape] getLength];
			
			// blank out the shape from the boardGrid before moving left
			[self removePiece];
			
			// place the shape on the game board one slot left
			for(int i = 0; i < len; ++i)
			{
				for(int j = 0; j < len; ++j)
				{
					if([[m_currentShapeGroup getCurrentShape] getElementAt:i column:j] > 0)
					{
						[m_Board setElementAt:m_currentShapeTop + i column:m_currentShapeLeft + j + 1 value: [[m_currentShapeGroup getCurrentShape] getElementAt:i column:j]];
					}
				}
			}
			
			// modify the (left, top) coordinate to denote the change in position
			++m_currentShapeLeft;
		}
	}
}

/////////////////////////////////////////////////

- (BOOL) updateBoard
{	
	if(m_bPieceActive)
	{
		if([self canMoveDown])
		{
			[self moveDown];
		}
		else
		{
			m_bPieceActive = FALSE;
		}
	}
	else
	{
		// The piece has now settled, remove the completed lines if any.
		[self removeCompletedLines];
		
		//		m_currentShapeGroup = [self getRandomAvailableShape];
		m_currentShapeGroup = m_piecePreviewShapeGroup;
		m_piecePreviewShapeGroup = [self getRandomAvailableShape];
		
		if([self canAddNewPiece])
		{
			// Add piece to board.
			// if current and next pieces are the same then the rotation state of the next piece needs to be reset.
			[m_currentShapeGroup  resetRotation];
			Shape1* curShape = [m_currentShapeGroup  getCurrentShape];
			int len = [curShape getLength];
			
			// check if space is available for the new piece to be added
			for(int i = 0; i < len; ++i)
			{
				for(int j = 0; j < len; ++j)
				{
					int slotVal = [[m_currentShapeGroup  getCurrentShape] getElementAt:i column:j];
					if(slotVal > 0)
					{
						[m_Board setElementAt:m_currentShapeTop + i column:m_currentShapeLeft + j value:slotVal];
					}
				}
			}
			m_bPieceActive = TRUE;
		}
		else
		{
			return FALSE;
		}
	}
	return TRUE;
}

- (BOOL) canAddNewPiece
{
	int len = [[m_currentShapeGroup  getCurrentShape] getLength];
	
	// check if space is available for the new piece to be added
	for(int i = 0; i < len; ++i)
	{
		for(int j = 0; j < len; ++j)
		{
			int slotVal = [[m_currentShapeGroup  getCurrentShape] getElementAt:i column:j];
			if(slotVal > 0 && [m_Board getElementAt:m_currentShapeTop + i column:m_currentShapeLeft + j] > 0)
			{
				// space not available on board, guess it's time to quit
				return false;
			}
		}
	}
	
	return true;
}

/**
 * Set Score.
 */
-(void)setScore:(int) newScore
{
	m_score = newScore;
}

/**
 * Set Score.
 */
-(int)getScore
{
	return m_score;
}

-(Shape1*)getPreviewShape
{
	return [m_piecePreviewShapeGroup getDefaultShape];
}

-(int)getPreviewId
{
	return [m_piecePreviewShapeGroup m_id];
}

-(int)getCurrentShapeGroupId
{
	return [m_currentShapeGroup m_id];
}

-(int)getCurrentShapeGroupRotationState
{
	return [m_currentShapeGroup m_curRotationState];
}

-(void)reviveSavedGame:(GameState1*) savedGameState
{
	printf("reviveSavedGame()\n");
	
	m_Board = [savedGameState m_Board];
	
	m_currentShapeLeft = [savedGameState m_currentShapeLeft];
	m_currentShapeTop = [savedGameState m_currentShapeTop];
	m_score = [savedGameState m_score];
	m_bPieceActive = [savedGameState m_bPieceActive];
	
	int curSGId = [savedGameState m_currentShapeGroupId];
	int prevSGId = [savedGameState m_piecePreviewShapeGroupId];
	int curRotState = [savedGameState m_currentShapeGroupRotationState];
	
	switch (curSGId) {
		case 1:
			curSGId = 0;
			break;
		case 2:
			curSGId = 1;
			break;
		case 4:
			curSGId = 2;
			break;
		case 8:
			curSGId = 3;
			break;
		case 16:
			curSGId = 4;
			break;
		case 32:
			curSGId = 5;
			break;
		case 64:
		default:
			curSGId = 6;
			break;
	}
	
	switch (prevSGId) {
		case 1:
			prevSGId = 0;
			break;
		case 2:
			prevSGId = 1;
			break;
		case 4:
			prevSGId = 2;
			break;
		case 8:
			prevSGId = 3;
			break;
		case 16:
			prevSGId = 4;
			break;
		case 32:
			prevSGId = 5;
			break;
		case 64:
		default:
			prevSGId = 6;
			break;
	}
	
	m_currentShapeGroup = [m_ShapeGroups objectAtIndex: curSGId];
	m_piecePreviewShapeGroup = [m_ShapeGroups objectAtIndex: prevSGId];
	[m_currentShapeGroup setM_curRotationState:curRotState];
}

-(void)resetGame
{
	printf("Tetris.resetGame()\n");
	[self clearBoard];
	[self setScore:0];
	m_bPieceActive = FALSE;
	m_currentShapeLeft = 0;
	m_currentShapeTop = 0;
	m_currentShapeGroup = [self getRandomAvailableShape];
	m_piecePreviewShapeGroup = [self getRandomAvailableShape];
	
	for(int i = 0; i < 7; ++i)
	{
		[[m_ShapeGroups objectAtIndex: i] setM_curRotationState:[ShapeGroup1 STATE_UNROTATED]];
	}
}

-(void)clearBoard
{
	printf("clearBoard()\n");
	int rows = [m_Board m_row];
	int cols = [m_Board m_col];
	for(int i = 0; i < rows; ++i)
	{
		for(int j = 0; j < cols; ++j)
		{
			[m_Board setElementAt:i column:j value:0];
		}
	}
}

-(void)dealloc
{
	[m_Board release];
	[super dealloc];
}


@end
