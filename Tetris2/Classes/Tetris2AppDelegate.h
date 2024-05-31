//
//  Tetris2AppDelegate.h
//  Tetris1
//
//  Created by Harshal Ogale on 2/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SplashViewController, SettingsViewController1, TetrisViewController1, Board1, Shape1;

@interface Tetris2AppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
    TetrisViewController1 *viewController;
	SplashViewController *splashViewController;
	SettingsViewController1 *settingsViewController;
	UIView* boardView;
	NSMutableArray *m_slotImage;
	NSMutableArray *m_previewImage;
	NSMutableArray *m_arrImages;
	NSMutableArray *m_arrPreviewImages;
	UIView* scoreView;
	UIView* previewView;
	UILabel* m_lblScore;
	UIColor *textColor;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TetrisViewController1 *viewController;
@property (nonatomic, retain) IBOutlet SplashViewController *splashViewController;
@property (nonatomic, retain) IBOutlet SettingsViewController1 *settingsViewController;
@property (nonatomic, retain) UIView* boardView;
@property (nonatomic, retain) UIView* scoreView;
@property (nonatomic, retain) UIView* previewView;
@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, retain) UILabel *m_lblScore;

@property (nonatomic, retain) NSMutableArray *m_slotImage;
@property (nonatomic, retain) NSMutableArray *m_previewImage;
@property (nonatomic, retain) NSMutableArray *m_arrImages;
@property (nonatomic, retain) NSMutableArray *m_arrPreviewImages;


- (id) init;

-(void)flipToGame;
-(void)flipToSettings;
-(void)flipToMain;

-(void)startGame;
-(void)pauseGame;
-(void)updateTimer: (float) newTime;
- (float) getUpdateTimerValue;

-(void)setDisplayBoard:(Board1*) board rows:(int) r columns:(int) c;
-(void)setDisplayScore:(int) newScore;
-(void)setPreview:(Shape1*) preivewShape rows:(int) r columns:(int) c;

@end

