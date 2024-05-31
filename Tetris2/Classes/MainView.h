//
//  MainView.h
//  Tetris
//

#import <UIKit/UIKit.h>


@interface MainView : UIView
{
	UILabel *theLabel;
}

- (IBAction) tellDelegateToFlipViews:(id)sender;

@property (nonatomic, retain) IBOutlet UILabel *theLabel;


@end
