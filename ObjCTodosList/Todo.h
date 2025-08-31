#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Todo : NSObject {
	NSString *title;
	NSString *text;
}

- (void)setTitle:(NSString *)newTitle;
- (NSString *)title;

- (void)setText:(NSString *)newText;
- (NSString *)text;

@end

NS_ASSUME_NONNULL_END
