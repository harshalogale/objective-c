//
//  Tetris1.h
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Board1, ShapeGroup1, Shape1, GameState1;
@class TetrisViewController1;

@interface Tetris1 : NSObject
{
	/**
	 * Width of the Tetris board
	 */
	int m_width;
	/**
	 * Height of the Tetris board
	 */
	int m_height;
	
	/**
	 * Box representing the Tetris game board
	 */
	Board1 *m_Board; // main board on which pieces will be moved and placed
	
	/**
	 * Array of basic shapes allowed.
	 */
	NSMutableArray *m_ShapeGroups;
	
	/**
	 * The shape currently in action on the board.
	 */
	ShapeGroup1 *m_currentShapeGroup;
	
	/**
	 * The next piece in line to be introduced.
	 */
	ShapeGroup1 *m_piecePreviewShapeGroup;
	
	/**
	 * The left coordinate of the current shape in action.
	 */
	int m_currentShapeLeft;
	
	/**
	 * The top coordinate of the current shape in action.
	 */
	int m_currentShapeTop;
	
	/**
	 * true if a piece is still active (can move down) on the board, false otherwise
	 */
	BOOL m_bPieceActive;
	
	/**
	 * Score
	 */
	int m_score;
	
	//TetrisViewController1 *m_VCParent;
}


@property (nonatomic, assign) ShapeGroup1 *m_currentShapeGroup;
@property (nonatomic, assign) ShapeGroup1 *m_piecePreviewShapeGroup;
@property (nonatomic, assign) TetrisViewController1 *m_VCParent;
@property (nonatomic, assign) NSMutableArray *m_ShapeGroups;

@property (nonatomic, retain) Board1 *m_Board;

@property int m_currentShapeLeft;
@property int m_currentShapeTop;
@property BOOL m_bPieceActive;
@property int m_score;

- (id) init:(int)width heightOfBoard:(int) height listOfShapes:(NSMutableArray *) listShapes;

/**
 * @return <code>true</code> if the current piece can be moved down one slot, <code>false</code> otherwise
 */
- (BOOL) canMoveDown;

/**
 * @return <code>true</code> if the current piece can be moved left one slot, <code>false</code> otherwise
 */
- (BOOL) canMoveLeft;

/**
 * Removes the current piece from the game board. Complements {@link #restorePiece()}.
 */
-(void)removePiece;

/**
 * Restores the current piece on the game board. Complements {@link #removePiece()}.
 */
-(void)restorePiece;


/**
 * @return <code>true</code> if the current piece can be moved right one slot, <code>false</code> otherwise
 */
- (BOOL) canMoveRight;

/**
 * @return <code>true</code> if the current piece can be rotated, <code>false</code> otherwise
 */
- (BOOL) canRotate;

/**
 * Rotate the shape once.
 */
-(void)rotateShape;

/**
 * Check if any lines are complete and remove those lines from the board.
 */
-(void)removeCompletedLines;

/**
 * Generates random partially filled lines and adds to the lower portion on the board.
 * @param nLinesToAdd Number of lines to be generated.
 * @return Number of lines successfully generated.
 */
-(int)generateRandomLines: (int) nLinesToAdd;

/**
 * 
 * @return A random shape from the list of basic shapes.
 */
- (ShapeGroup1*) getRandomAvailableShape;

/**
 * Checks if the given point lies of the board.
 * @param x x coordinate of the point
 * @param y y coordinate of the point
 * @return <code>true</code> if the point lies on the board, <code>false</code> otherwise
 */
- (BOOL) checkBounds:(int) x yCoord: (int) y;

/**
 * Moves the current piece leftwards by one slot.
 */
-(void)moveLeft;
-(void)moveLeft:(int) magnitude;

/**
 * Moves the current piece rightwards by one slot.
 */
-(void)moveRight;
-(void)moveRight:(int) magnitude;

/**
 * Moves the current piece downwards by one slot.
 */
-(void)moveDown;	

/**
 * Moves the piece downwards until it touches either a filled slot or the bottom of the game board.
 */
-(void)moveDownToEnd;

/**
 * 
 */
- (BOOL) updateBoard;

/**
 * Returns the game Board object.
 */
- (Board1*) getBoard;

/**
 * Returns the piece preview image Board object.
 */
- (Shape1*) getPreviewShape;

/**
 * Returns id of the preview shapegroup.
 */
-(int)getPreviewId;

-(int)getCurrentShapeGroupId;

-(int)getCurrentShapeGroupRotationState;

/**
 * True if the game board has enough space for a new piece to be added, false otherwise.
 */
- (BOOL) canAddNewPiece;

/**
 * Set Score.
 */
-(void)setScore:(int) newScore;

/**
 * Set Score.
 */
-(int)getScore;

-(void)reviveSavedGame:(GameState1*) savedGameState;

-(void)resetGame;

-(void)clearBoard;

@end
