//
//  Todo.m
//  ObjCTodosList
//
//  Created by Michael on 31.08.25.
//

#import "Todo.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Todo

- (void)setTitle:(NSString *)newTitle
{
	title = newTitle;
}

- (NSString *)title
{
	return title;
}

- (void)setText:(NSString *)newText
{
	text = newText;
}

- (NSString *)text {
	return text;
}

@end

NS_ASSUME_NONNULL_END
