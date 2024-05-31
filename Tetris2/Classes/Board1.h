//
//  Board1.h
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Board1 : NSObject
{
	int m_row;
	int m_col;
	
	NSMutableArray *m_board;
}

@property int m_row;
@property int m_col;
@property (nonatomic, retain) NSMutableArray *m_board;

- (id) init: (int) row columnsPerRow:(int) col;
-(int)getElementAt: (int) row column:(int) col;
-(void)setElementAt: (int) row column:(int) col value:(int) val;

@end
