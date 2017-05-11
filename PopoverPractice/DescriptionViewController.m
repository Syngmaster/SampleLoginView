//
//  DescriptionViewController.m
//  PopoverPractice
//
//  Created by Syngmaster on 10/05/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "DescriptionViewController.h"

@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)dismissAction:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void) dealloc {
    NSLog(@"VC deallocated");
}


@end
