//
//  DetailsViewController.m
//  ObjCTodosList
//
//  Created by Michael on 16.08.25.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	titleLabel.text = _todoTitle;
	textLabel.text = _todoText;
}

@end
