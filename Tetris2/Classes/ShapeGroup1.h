//
//  ShapeGroup1.h
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Shape1;

@interface ShapeGroup1 : NSObject
{
	/** Constant for Left-L shape piece. */
	int SHAPE_LEFT_L;
	/** Constant for Right-L shape piece. */
	int SHAPE_RIGHT_L;
	/** Constant for T shape piece. */
	int SHAPE_T;
	/** Constant for Line shape piece. */
	int SHAPE_LINE;
	/** Constant for Left-Z shape piece. */
	int SHAPE_LEFT_Z;
	/** Constant for Right-Z shape piece. */
	int SHAPE_RIGHT_Z;
	/** Constant for Left-Square shape piece. */
	int SHAPE_SQUARE;
	
	/** Constant for Unrotated - rotation state of a piece. Corresponds to location zero of the array m_arrShapes. */
	int STATE_UNROTATED;
	
	/** Pointer to the array of shapes in the group. */
	NSMutableArray *m_Shapes;
	
	/**
	 * Current rotation state of the shape. Corresponds to m_arrShapes array location.
	 */
	int m_curRotationState;
	
	/**
	 * Max rotation states. Equals the number of shapes in m_arrShapes. 
	 */
	int m_maxRotationStates;
	
	/**
	 * Id of the ShapeGroup. One of SHAPE_* constants.
	 */
	int m_id;
	
	
	
	
	
//	//SHAPE_LEFT_L:
//	
//	//	 __  __  __
//	//	|__||__||__|
//	//	        |__|
//	
//	int arrLen1;
//	
//	NSMutableArray *arr11, *arr12, *arr13, *arr14;
//	
//	//SHAPE_RIGHT_L:
//	
//	//		 __  __  __
//	//   	|__||__||__|
//	//	    |__|
//	
//	int arrLen2;
//	
//	NSMutableArray *arr21, *arr22, *arr23, *arr24;
//	
//	//SHAPE_T:
//	
//	//			 __
//	//		 __ |__| __
//	//	 	|__||__||__|
//	
//	int arrLen3;
//	
//	NSMutableArray *arr31, *arr32, *arr33, *arr34;
//	
//	
//	
//	//SHAPE_LINE:
//	
//	//	 __  __  __  __
//	//	|__||__||__||__|
//	
//	int arrLen4;
//	//Shape* arrShapes4[arrLen];
//	
//	NSMutableArray *arr41, *arr42;
//	
//	
//	//SHAPE_LEFT_Z:
//	
//	//	 __  __ 
//	//	|__||__| __
//	//	    |__||__|
//	
//	int arrLen5;
//	//Shape* arrShapes5[arrLen];
//	
//	NSMutableArray *arr51, *arr52;
//	
//	//SHAPE_RIGHT_Z:
//	
//	//		 __ __  
//	// 	 __ |__|__|
//	//	|__||__|
//	
//	int arrLen6;
//	//Shape* arrShapes6[arrLen];	
//	
//	NSMutableArray *arr61, *arr62;
//	
//	//SHAPE_SQUARE:
//	
//	//	 __  __
//	//	|__||__|
//	//	|__||__|
//	
//	int arrLen7;
//	
//	NSMutableArray *arr71;
	
}

@property int m_curRotationState;
@property int m_maxRotationStates;
@property int m_id;

@property (nonatomic, retain) NSMutableArray *m_Shapes;

- (id) init:(NSMutableArray *) shapes numberOfShapes: (int) n shapeGroupId: (int) id;

-(int)getMaxRotationStates;

/**
 * 
 * @return The shape for current rotation state.
 */
- (Shape1 *) getCurrentShape;

/**
 * 
 * @return The shape when rotated.
 */
- (Shape1 *) getRotatedShape;

/**
 * 
 * @return Default shape for the ShapeGroup.
 */
- (Shape1 *) getDefaultShape;


/**
 * Modify the state of the shape to mark it as rotated.
 */
-(void)markRotated;

/**
 * Modify the state of the shape to mark it as unrotated.
 */
-(void)resetRotation;

/**
 * 
 * @param shapeId Id of the predefined shape. One of SHAPE_* constants.
 * @return Shape object of the predefined shape.
 */
+ (ShapeGroup1 *) getPredefinedShapeGroup:(int) shapeGroupId;

+ (int) SHAPE_LEFT_L;
+ (int) SHAPE_RIGHT_L;
+ (int) SHAPE_T;
+ (int) SHAPE_LINE;
+ (int) SHAPE_LEFT_Z;
+ (int) SHAPE_RIGHT_Z;
+ (int) SHAPE_SQUARE;
+ (int) STATE_UNROTATED;

+ (NSMutableArray *) arr11;
+ (NSMutableArray *)  arr12; 
+ (NSMutableArray *)  arr13; 
+ (NSMutableArray *)  arr14;
+ (NSMutableArray *) arr21; 
+ (NSMutableArray *)  arr22; 
+ (NSMutableArray *)  arr23; 
+ (NSMutableArray *)  arr24;
+ (NSMutableArray *) arr31; 
+ (NSMutableArray *)  arr32; 
+ (NSMutableArray *)  arr33; 
+ (NSMutableArray *)  arr34;
+ (NSMutableArray *) arr41; 
+ (NSMutableArray *)  arr42;
+ (NSMutableArray *) arr51; 
+ (NSMutableArray *)  arr52;
+ (NSMutableArray *) arr61; 
+ (NSMutableArray *)  arr62;
+ (NSMutableArray *) arr71;




@end
