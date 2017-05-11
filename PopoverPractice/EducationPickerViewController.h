//
//  EducationPickerViewController.h
//  PopoverPractice
//
//  Created by Syngmaster on 10/05/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EducationViewControllerDelegate;

@interface EducationPickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIPickerView *educationPicker;
@property (weak, nonatomic) id <EducationViewControllerDelegate> delegate;

@property (strong, nonatomic) NSString *chosenEducation;

- (IBAction)dismissAction:(UIBarButtonItem *)sender;

@end


@protocol EducationViewControllerDelegate <NSObject>

- (void)viewController:(EducationPickerViewController *) viewController educationTypeFromPicker:(NSString *) educationType;

@end
