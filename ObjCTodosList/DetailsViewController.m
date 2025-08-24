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
	todoLabel.text = _todoText;
}

@end
