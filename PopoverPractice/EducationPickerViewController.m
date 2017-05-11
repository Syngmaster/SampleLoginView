//
//  EducationPickerViewController.m
//  PopoverPractice
//
//  Created by Syngmaster on 10/05/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "EducationPickerViewController.h"

@interface EducationPickerViewController () <UIPickerViewDataSource>

@property (strong, nonatomic) NSArray *array;

@end

@implementation EducationPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@"Primary school",@"Secondary school",@"High school",@"Bachelor degree",@"Master degree"];
    self.array = array;
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    for (NSString *value in self.array) {
        
        if ([value isEqualToString:self.chosenEducation]) {
            
            [self.educationPicker selectRow:[self.array indexOfObject:value] inComponent:0 animated:YES];
    
        }
        
    }
    
}

#pragma mark - UIPickerViewDataSource

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
    
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.array.count;
    
}

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return self.array[row];
    
}

#pragma mark - UIPickerViewDelegate


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    self.chosenEducation = self.array[row];
    
}

#pragma mark - Action

- (IBAction)dismissAction:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate viewController:self educationTypeFromPicker:self.chosenEducation];
}


@end
