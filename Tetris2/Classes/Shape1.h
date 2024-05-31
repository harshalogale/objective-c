//
//  Shape1.h
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Shape1 : NSObject
{
	/**
	 * Array of shape boxes in all allowed rotation states. Entry at 0 being the default and compulsory.
	 */
	NSMutableArray *m_box;
	
	/**
	 * Length of the containing square box of the shape
	 */
	int m_length;
}


@property (nonatomic, retain) NSMutableArray *m_box;

@property int m_length;


- (id) init: (NSMutableArray *) box length:(int) len;

/**
 * 
 * @return Length of the enclosing square box of the shape.
 */
-(int)getLength;

-(int)getElementAt: (int) row column:(int) col;

-(void)setElementAt: (int) row column:(int) col value:(int) val;

@end