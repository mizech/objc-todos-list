#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController
// https://www.youtube.com/watch?v=jPfFeeOwSVI
- (void)viewDidLoad {
    [super viewDidLoad];
	titleLabel.text = _todoTitle;
	textLabel.text = _todoText;
}
// Todo: Transfer updated values back to the list.
- (IBAction)editButtonTouched:(id)sender {
	UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Edit Todo" message:@"Change title and text" preferredStyle:UIAlertControllerStyleAlert];
	[alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
		textField.placeholder = @"Todo title";
		textField.text = _todoText;
		textField.clearButtonMode = UITextFieldViewModeWhileEditing;
	}];
	[alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
		textField.placeholder = @"Todo title";
		textField.text = _todoTitle;
		textField.clearButtonMode = UITextFieldViewModeWhileEditing;
	}];
	UIAlertAction *action = [UIAlertAction actionWithTitle:@"Login" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		_todoTitle = alertVC.textFields[0].text;
		_todoText = alertVC.textFields[1].text;
		titleLabel.text = _todoTitle;
		textLabel.text = _todoText;
	}];
	[alertVC addAction:action];
	[self presentViewController:alertVC animated:true completion:nil];
}

@end
