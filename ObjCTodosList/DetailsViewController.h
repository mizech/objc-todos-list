#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController {
	__weak IBOutlet UILabel *titleLabel;
	__weak IBOutlet UILabel *textLabel;
}

@property NSString* todoTitle;
@property NSString* todoText;
@end

NS_ASSUME_NONNULL_END
