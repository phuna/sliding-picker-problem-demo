//
//  ViewController.m
//  SlidingPickerViewTest
//
//  Created by Phu Nguyen Anh on 3/13/16.
//  Copyright © 2016 Phu Nguyen Anh. All rights reserved.
//

#import "ViewController.h"
#import "ItemViewController.h"
#import <AYSlidingPickerView/AYSlidingPickerView.h>

@interface ViewController () {
    NSMutableArray *texts;
    AYSlidingPickerView *pickerView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    texts = [[NSMutableArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([texts count] > 0) {
        pickerView = [AYSlidingPickerView sharedInstance];
        
        NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:[texts count]];
        for (NSString *s in texts) {
            AYSlidingPickerViewItem *item = [[AYSlidingPickerViewItem alloc] initWithTitle:s handler:^(BOOL completed) {
                self.navigationController.title = s;
            }];
            [items addObject:item];
        }
        pickerView.mainView = self.view;
        pickerView.items = items;
        pickerView.selectedIndex = 0;
        pickerView.closeOnSelection = YES;
        [pickerView addGestureRecognizersToNavigationBar:self.navigationController.navigationBar];
    }

//    [[UIApplication sharedApplication].delegate.window sendSubviewToBack:pickerView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // ------------------------------------------------------
    // PROBLEM
    // ------------------------------------------------------
    // With the line below commented out, problem will occur
    //
    // [[UIApplication sharedApplication].delegate.window sendSubviewToBack:pickerView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [pickerView removeGestureRecognizersFromNavigationBar:self.navigationController.navigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addItem:(id)sender {
    ItemViewController *ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemViewController"];
    ivc.texts = texts;
    [self presentViewController:ivc animated:YES completion:nil];
//    [self.navigationController pushViewController:ivc animated:YES];
    
}

@end
