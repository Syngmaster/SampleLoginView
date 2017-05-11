//
//  TableViewController.h
//  PopoverPractice
//
//  Created by Syngmaster on 10/05/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateBirthTextField;
@property (weak, nonatomic) IBOutlet UITextField *educationTextField;

- (IBAction)showPopAction:(UIBarButtonItem *)sender;

@end
