//
//  Shape1.m
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Shape1.h"


@implementation Shape1

@synthesize m_length, m_box;

- (id) init: (NSMutableArray *) box length:(int) len;
{
	if(self = [super init])
	{
		self.m_box = box;
		self.m_length = len;
	}
	
	return self;
}

/**
 * 
 * @return Length of the enclosing square box of the shape.
 */
-(int)getLength
{
	return m_length;
}

-(int)getElementAt:(int)row column:(int)col
{
	NSNumber *aNum = [m_box count] > (row * m_length + col) ? (NSNumber *) [m_box objectAtIndex:(row * m_length + col)] : nil;
	return nil != aNum ? [aNum intValue] : -1;
}

-(void)setElementAt:(int)row column:(int)col value:(int)val
{
	[m_box replaceObjectAtIndex:(row * m_length + col) withObject:[NSNumber numberWithInt:val]];
}

-(void)dealloc
{
	[m_box release];
	[super dealloc];
}

@end
