//
//  ItemViewController.m
//  SlidingPickerViewTest
//
//  Created by Phu Nguyen Anh on 3/13/16.
//  Copyright © 2016 Phu Nguyen Anh. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textToAdd;

@end

@implementation ItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateStyle:NSDateFormatterFullStyle];
  
  self.textToAdd.text = [formatter stringFromDate:[NSDate date]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addItemTapped:(id)sender {
  [self.texts addObject:self.textToAdd.text];
  [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
