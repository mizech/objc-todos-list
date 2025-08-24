//
//  DetailsViewController.h
//  ObjCTodosList
//
//  Created by Michael on 16.08.25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController {
	__weak IBOutlet UILabel *todoLabel;
}

@property NSString* todoText;
@end

NS_ASSUME_NONNULL_END
