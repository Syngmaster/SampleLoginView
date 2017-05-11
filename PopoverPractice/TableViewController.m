//
//  TableViewController.m
//  PopoverPractice
//
//  Created by Syngmaster on 10/05/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "TableViewController.h"
#import "DescriptionViewController.h"
#import "DatePickerViewController.h"
#import "EducationPickerViewController.h"

@interface TableViewController () <UIPopoverPresentationControllerDelegate, UITextFieldDelegate, DatePickerViewControllerDelegate, EducationViewControllerDelegate>

@property (strong, nonatomic) UIPopoverPresentationController *popVC;
@property (strong, nonatomic) NSDate *chosenDate;
@property (strong, nonatomic) NSString *chosenEducation;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


#pragma mark - Actions

- (IBAction)showPopAction:(UIBarButtonItem *)sender {
    
    DescriptionViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DescriptionViewController"];
    vc.modalPresentationStyle = UIModalPresentationPopover;
    vc.preferredContentSize = CGSizeMake(300, 300);

    UIPopoverPresentationController *popVC = [vc popoverPresentationController];
    popVC.permittedArrowDirections = UIModalPresentationNone;
    popVC.barButtonItem = sender;
    popVC.delegate = self;
    self.popVC = popVC;

    [self presentViewController:vc animated:YES completion:nil];

}


- (void)showController:(UIViewController *) vc inPopoverFromSender:(UITextField *) textField  {
    
    vc.preferredContentSize = CGSizeMake(300, 300);
    vc.modalPresentationStyle = UIModalPresentationPopover;
    
    UIPopoverPresentationController *popVC = [vc popoverPresentationController];
    popVC.permittedArrowDirections = UIPopoverArrowDirectionUp;
    popVC.sourceView = textField;
    popVC.sourceRect = textField.frame;
    popVC.delegate = self;
    self.popVC = popVC;
    
    [self presentViewController:vc animated:YES completion:nil];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    
    self.popVC = nil;
    
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    
    return UIModalPresentationNone;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if ([textField isEqual:self.dateBirthTextField]) {
        DatePickerViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DatePickerViewController"];
        vc.delegate = self;
        vc.chosenDate = self.chosenDate;
        [self showController:vc inPopoverFromSender:self.dateBirthTextField];

        return NO;
        
    }
    
    if([textField isEqual:self.educationTextField]) {
        
        EducationPickerViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EducationPickerViewController"];
        vc.delegate = self;
        vc.chosenEducation = self.chosenEducation;
        [self showController:vc inPopoverFromSender:self.educationTextField];
        
        return NO;

    }
    
    return YES;
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.firstNameTextField]) {
        
        [self.lastNameTextField becomeFirstResponder];
        
    } else if ([textField isEqual:self.lastNameTextField]) {
        
        [textField resignFirstResponder];
        
    }
    
    return YES;
}

#pragma mark - DatePickerViewControllerDelegate

- (void)viewController:(DatePickerViewController *)viewController dateFromPicker:(NSDate *)date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    
    self.dateBirthTextField.text = [formatter stringFromDate:date];
    self.chosenDate = date;
    
}

#pragma mark - EducationViewControllerDelegate

- (void)viewController:(EducationPickerViewController *)viewController educationTypeFromPicker:(NSString *)educationType {
    
    self.educationTextField.text = educationType;
    self.chosenEducation = educationType;
    
}



@end
