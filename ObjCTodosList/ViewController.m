//
//  ViewController.m
//  ObjCTodosList
//
//  Created by Michael on 16.08.25.
// Tutorials: https://www.youtube.com/watch?v=7_QlA7QchW0&list=PLSyUY9cUrmowl_1B_T1Jlo_zJAhbTyS1F
// https://www.youtube.com/@polyglotengineer/videos
// Class Creation: https://www.youtube.com/watch?v=tN8DFj2fB2g

#import "ViewController.h"
#import "DetailsViewController.h"
#import "Todo.h";

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
		Todo *todo = [[Todo alloc] init];
		todo.title = todoTitle;
		todo.text = @"Placeholder-text";
		[todos addObject:todo];
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
	Todo *todo = (Todo *)todos[indexPath.row];
	cell.textLabel.text = todo.title;
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self performSegueWithIdentifier:@"goToDetails" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"goToDetails"]) {
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		DetailsViewController *details = (DetailsViewController *)segue.destinationViewController;
		Todo *todo = (Todo *)todos[indexPath.row];
		details.todoText = todo.title;
		details.todoText2 = todo.text;
	}
}

@end
