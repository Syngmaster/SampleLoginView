//
//  DatePickerViewController.m
//  PopoverPractice
//
//  Created by Syngmaster on 10/05/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.chosenDate) {
        self.datePicker.date = self.chosenDate;
    }

}



#pragma mark - Action

- (IBAction)dismissAction:(UIButton *)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate viewController:self dateFromPicker:self.chosenDate];

    
}

- (IBAction)datePickerValueChanged:(UIDatePicker *)sender {

    self.chosenDate = sender.date;
    
}


@end
