#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController {
	__weak IBOutlet UILabel *todoLabel;
	__weak IBOutlet UILabel *textLabel;
}

@property NSString* todoText;
@property NSString* todoText2;
@end

NS_ASSUME_NONNULL_END
