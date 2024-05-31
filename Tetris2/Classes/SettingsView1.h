//
//  SettingsView1.h
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SettingsView1 : UIView {
	UISegmentedControl *myShinyButton;
}

@property (nonatomic, retain) IBOutlet UISegmentedControl *myShinyButton;

- (id) init;

- (IBAction) backToGame:(id)sender;
- (IBAction) sliderMoved: (id) sender;

-(void)setSliderValue: (float) newValue;

@end