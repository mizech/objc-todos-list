//
//  ViewController.m
//  ObjCTodosList
//
//  Created by Michael on 16.08.25.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate> {
	NSMutableArray *todos;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	todos = [[NSMutableArray alloc] init];
	_tableView.dataSource = self;
	_tableView.delegate = self;
	
	self.navigationItem.title = @"ToDos-List";
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewTodo:)];
}

- (void)addNewTodo:(UIBarButtonItem *)sender {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
	[alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
		textField.placeholder = @"Enter Todo-title";
		textField.clearButtonMode = UITextFieldViewModeWhileEditing;
	}];
	UIAlertAction *insertButton = [UIAlertAction actionWithTitle:@"Insert" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		NSString *todoTitle = alert.textFields[0].text;
		[todos addObject:todoTitle];
		[self.tableView reloadData];
	}];
	[alert addAction:insertButton];
	UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
	[alert addAction:cancelButton];
	[self presentViewController:alert animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return todos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
	cell.textLabel.text = todos[indexPath.row];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self performSegueWithIdentifier:@"goToDetails" sender:self];
}

@end
