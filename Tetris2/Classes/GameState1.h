//
//  GameState1.h
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Board1;

@interface GameState1 : NSObject {
	/**
	 * Box representing the Tetris game board
	 */
	Board1* m_Board; // main board on which pieces will be moved and placed
	
	/**
	 * The shape currently in action on the board.
	 */
	int m_currentShapeGroupId;
	
	/**
	 * The next piece in line to be introduced.
	 */
	int m_piecePreviewShapeGroupId;
	
	/**
	 * Rotation State of the current ShapeGroup.
	 */
	int m_currentShapeGroupRotationState;
	
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
	int m_bPieceActive;
	
	/**
	 * Score
	 */
	int m_score;
}

@property (nonatomic, retain) Board1* m_Board;

@property int m_currentShapeGroupId;
@property int m_piecePreviewShapeGroupId;
@property int m_currentShapeGroupRotationState;
@property int m_currentShapeLeft;
@property int m_currentShapeTop;
@property int m_bPieceActive;
@property int m_score;

-(void)setBoard:(NSMutableArray*) board rows:(int)r cols:(int)c;

@end
