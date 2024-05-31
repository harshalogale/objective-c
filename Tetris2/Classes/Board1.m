//
//  Board1.m
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Board1.h"

@implementation Board1

@synthesize m_row;
@synthesize m_col;
@synthesize m_board;

-(id)init:(int)row columnsPerRow:(int)col
{
	if(self = [super init])
	{
		self.m_row = row;
		self.m_col = col;
		
		NSMutableArray *aMutableArray = [[NSMutableArray alloc] initWithCapacity: self.m_row * self.m_col];
		
		NSNumber *aNum = [NSNumber numberWithInt:-1];
		int len = self.m_row * self.m_col;
		for (int i = 0; i < len; ++i) {
			[aMutableArray addObject: aNum];
		}
		
		self.m_board = aMutableArray;
		[aMutableArray release];
	}
	return self;
}

-(int)getElementAt:(int)row column:(int)col
{
	NSNumber *aNum = [m_board count] > (row * m_col + col) ? (NSNumber *)[m_board objectAtIndex:(row * m_col + col)] : nil;
	return nil != aNum ? [aNum intValue] : -1;
}

-(void)setElementAt:(int)row column:(int)col value:(int)val
{
	[m_board replaceObjectAtIndex:(row * m_col + col) withObject:[NSNumber numberWithInt:val]];
}

-(void)dealloc
{
	[m_board release];
	[super dealloc];
}

@end
