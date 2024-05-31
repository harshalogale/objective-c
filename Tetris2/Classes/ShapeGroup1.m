//
//  ShapeGroup1.m
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ShapeGroup1.h"
#import "Shape1.h"

@implementation ShapeGroup1

//SHAPE_LEFT_L:

//	 __  __  __
//	|__||__||__|
//	        |__|

+ (NSMutableArray *) arr11
{
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:2], [NSNumber numberWithInt:2], [NSNumber numberWithInt:2], 
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:2], 
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
}
+ (NSMutableArray *) arr12
{
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:2], [NSNumber numberWithInt:2], [NSNumber numberWithInt:0], 
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], 
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
}
+ (NSMutableArray *) arr13
{
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], 
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], 
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:2], [NSNumber numberWithInt:2], nil];
}
+ (NSMutableArray *) arr14
{
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:2], 
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:2],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:2], [NSNumber numberWithInt:2], nil];
}

//SHAPE_RIGHT_L:

//		 __  __  __
//   	|__||__||__|
//	    |__|

+ (NSMutableArray *) arr21 {
	
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:3], [NSNumber numberWithInt:3], [NSNumber numberWithInt:3], 
			[NSNumber numberWithInt:3], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
}
+ (NSMutableArray *) arr22 {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:3], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], 
			[NSNumber numberWithInt:3], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], 
			[NSNumber numberWithInt:3], [NSNumber numberWithInt:3], [NSNumber numberWithInt:0], nil];
}
+ (NSMutableArray *) arr23 {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:3], 
			[NSNumber numberWithInt:3], [NSNumber numberWithInt:3], [NSNumber numberWithInt:3], nil];
}
+ (NSMutableArray *) arr24 {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:0], [NSNumber numberWithInt:3], [NSNumber numberWithInt:3], 
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:3], 
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:3], nil];
}
//SHAPE_T:

//			 __
//		 __ |__| __
//	 	|__||__||__|


+ (NSMutableArray *) arr31 {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:1], [NSNumber numberWithInt:1], [NSNumber numberWithInt:1], 
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:1], [NSNumber numberWithInt:0],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
}
+ (NSMutableArray *) arr32 {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:1], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0],
			[NSNumber numberWithInt:1], [NSNumber numberWithInt:1], [NSNumber numberWithInt:0],
			[NSNumber numberWithInt:1], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
}
+ (NSMutableArray *) arr33 {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:1], [NSNumber numberWithInt:0], 
			[NSNumber numberWithInt:1], [NSNumber numberWithInt:1], [NSNumber numberWithInt:1], nil];
}
+ (NSMutableArray *) arr34 {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:1],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:1], [NSNumber numberWithInt:1],  
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:1], nil];
}


//SHAPE_LINE:

//	 __  __  __  __
//	|__||__||__||__|
//Shape* arrShapes4[arrLen];

+ (NSMutableArray *) arr41 {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:4], [NSNumber numberWithInt:4], [NSNumber numberWithInt:4], [NSNumber numberWithInt:4],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
}
+ (NSMutableArray *) arr42 {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:4], [NSNumber numberWithInt:0],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:4], [NSNumber numberWithInt:0],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:4], [NSNumber numberWithInt:0],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:4], [NSNumber numberWithInt:0], nil];
}
//SHAPE_LEFT_Z:

//	 __  __ 
//	|__||__| __
//	    |__||__|

//Shape* arrShapes5[arrLen];

+ (NSMutableArray *) arr51 {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:5], [NSNumber numberWithInt:5], [NSNumber numberWithInt:0], 
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:5], [NSNumber numberWithInt:5],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
}
+ (NSMutableArray *) arr52  {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:0], [NSNumber numberWithInt:5], [NSNumber numberWithInt:0], 
			[NSNumber numberWithInt:5], [NSNumber numberWithInt:5], [NSNumber numberWithInt:0], 
			[NSNumber numberWithInt:5], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
}
//SHAPE_RIGHT_Z:

//		 __ __  
// 	 __ |__|__|
//	|__||__|

//Shape* arrShapes6[arrLen];	

+ (NSMutableArray *) arr61 {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:0], [NSNumber numberWithInt:6], [NSNumber numberWithInt:6], 
			[NSNumber numberWithInt:6], [NSNumber numberWithInt:6], [NSNumber numberWithInt:0],
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
}
+ (NSMutableArray *) arr62 {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:0], [NSNumber numberWithInt:6], [NSNumber numberWithInt:0], 
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:6], [NSNumber numberWithInt:6], 
			[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:6], nil];
}
//SHAPE_SQUARE:

//	 __  __
//	|__||__|
//	|__||__|


+ (NSMutableArray *) arr71 {
	return [NSMutableArray arrayWithObjects: [NSNumber numberWithInt:7], [NSNumber numberWithInt:7], 
			[NSNumber numberWithInt:7], [NSNumber numberWithInt:7], nil];
}



@synthesize m_curRotationState;
@synthesize m_maxRotationStates;
@synthesize m_id;
@synthesize m_Shapes;

+(int)SHAPE_LEFT_L
{
	return 1;
}

+(int)SHAPE_RIGHT_L
{
	return 2;
}

+(int)SHAPE_T
{
	return 4;
}

+(int)SHAPE_LINE
{
	return 8;
}

+(int)SHAPE_LEFT_Z
{
	return 16;
}

+(int)SHAPE_RIGHT_Z
{
	return 32;
}

+(int)SHAPE_SQUARE
{
	return 64;
}

+(int)STATE_UNROTATED
{
	return 0;
}

-(int)getMaxRotationStates
{
	return m_maxRotationStates;
}

-(id)init:(NSMutableArray *)shapes numberOfShapes:(int)n shapeGroupId:(int)id
{
	if(self = [super init])
	{
		self.m_maxRotationStates = n;
		self.m_Shapes = shapes;
		self.m_id = id;
	}
	return self;
}

/**
 * 
 * @return The shape when rotated.
 */
-(Shape1 *)getRotatedShape
{
	return [m_Shapes objectAtIndex:((m_curRotationState + 1) % m_maxRotationStates)];
}

/**
 * 
 * @return The shape for current rotation state.
 */
-(Shape1 *)getCurrentShape
{
	return [m_Shapes objectAtIndex:m_curRotationState];
}

/**
 * 
 * @return Default shape for the ShapeGroup.
 */
-(Shape1 *)getDefaultShape
{
	return [m_Shapes objectAtIndex:[ShapeGroup1 STATE_UNROTATED]];
}

/**
 * Modify the state of the shape to mark it as rotated.
 */
-(void)markRotated
{
	m_curRotationState = (++m_curRotationState) % m_maxRotationStates;
}

/**
 * Modify the state of the shape to mark it as unrotated.
 */
-(void)resetRotation
{
	m_curRotationState = [ShapeGroup1 STATE_UNROTATED];
}

/**
 * 
 * @param shapeId Id of the predefined shape. One of SHAPE_* constants.
 * @return ShapeGroup object of the predefined shape.
 */
+(ShapeGroup1 *)getPredefinedShapeGroup:(int)shapeGroupId
{
	NSMutableArray *shapesInGroup = [[NSMutableArray alloc] initWithCapacity:0];
	
	int arrLen1 = 4;
	int arrLen2 = 4;
	int arrLen3 = 4;
	int arrLen4 = 2;
	int arrLen5 = 2;
	int arrLen6 = 2;
	int arrLen7 = 1;
	
	int arrLen = 0;
	int id = 0;
	
	switch (shapeGroupId)
	{
		case 1: // SHAPE_LEFT_L:
		{
			//	 __  __
			//	|__||__|
			//	|__|
			//	|__|
			
			arrLen = arrLen1;
			
			[shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr11] length:3] autorelease]];
            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr12] length:3] autorelease]];
            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr13] length:3] autorelease]];
			[shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr14] length:3] autorelease]];
			id = 1;
			//			shapesInGroup = arrShapes1;
			break;
		}
		case 2://SHAPE_RIGHT_L:
		{
			//		 __  __ 
			//   	|__||__|
			//	        |__|
			//	        |__|
			
			arrLen = arrLen2;
			
            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr21] length:3] autorelease]];
            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr22] length:3] autorelease]];
            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr23] length:3] autorelease]];
            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr24] length:3] autorelease]];
			id = 2;

			break;
		}
		case 4://SHAPE_T:
		{	
			//			 __
			//		 __ |__| __
			//	 	|__||__||__|
			
			arrLen = arrLen3;

            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr31] length:3] autorelease]];
            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr32] length:3] autorelease]];
            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr33] length:3] autorelease]];
            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr34] length:3] autorelease]];
			id = 4;

			break;
		}	
		case 8://SHAPE_LINE:
		{	
			//	 __  __  __  __
			//	|__||__||__||__|
			
			arrLen = arrLen4;
			
            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr41] length:4] autorelease]];
            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr42] length:4] autorelease]];
			id = 8;

			break;
		}		
		case 16://SHAPE_LEFT_Z:
		{	
			//	 __  __ 
			//	|__||__| __
			//	    |__||__|
			
			arrLen = arrLen5;

            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr51] length:3] autorelease]];
            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr52] length:3] autorelease]];
			id = 16;

			break;
		}
		case 32://SHAPE_RIGHT_Z:
		{
			//		 __ __  
			// 	 __ |__|__|
			//	|__||__|
			
			arrLen = arrLen6;

            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr61] length:3] autorelease]];
            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr62] length:3] autorelease]];
			id = 32;

			break;
		}
		case 64://SHAPE_SQUARE:
		default:
		{	
			//	 __  __
			//	|__||__|
			//	|__||__|
			
			arrLen = arrLen7;

            [shapesInGroup addObject: [[[Shape1 alloc] init:[ShapeGroup1 arr71] length:2] autorelease]];
			id = 64;

			break;
		}
	}
	//return [[[ShapeGroup1 alloc] init:[shapesInGroup autorelease] numberOfShapes:arrLen shapeGroupId:id] autorelease];
	return [[ShapeGroup1 alloc] init:[shapesInGroup autorelease] numberOfShapes:arrLen shapeGroupId:id];
}

@end
