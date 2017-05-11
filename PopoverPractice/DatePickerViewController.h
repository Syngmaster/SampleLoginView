//
//  DatePickerViewController.h
//  PopoverPractice
//
//  Created by Syngmaster on 10/05/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerViewControllerDelegate;

@interface DatePickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) id <DatePickerViewControllerDelegate> delegate;

@property (strong, nonatomic) NSDate *chosenDate;


- (IBAction)dismissAction:(UIBarButtonItem *)sender;
- (IBAction)datePickerValueChanged:(UIDatePicker *)sender;


@end

@protocol DatePickerViewControllerDelegate <NSObject>

- (void)viewController:(DatePickerViewController *) viewController dateFromPicker:(NSDate *) date;

@end
