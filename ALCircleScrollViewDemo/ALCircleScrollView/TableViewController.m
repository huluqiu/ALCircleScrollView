//
//  TableViewController.m
//  ALCircleScrollView
//
//  Created by alezai on 15/10/18.
//  Copyright © 2015年 alezai. All rights reserved.
//

#import "TableViewController.h"
#import "ALCircleScrollView.h"

@interface TableViewController () <UITableViewDataSource,UITableViewDelegate, ALCircleScrollViewDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ALCircleScrollView *circleView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.circleView = [[ALCircleScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    self.circleView.delegate = self;
    [self.circleView reloadData];
    [self.tableView setTableHeaderView:self.circleView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.circleView addTimer];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.circleView removeTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

#pragma mark - ALCircleScrollView delegate

- (NSUInteger)numberOfViewsInScrollView:(UIScrollView *)scrollView{
    return 3;
}

- (UIView *)scrollView:(UIScrollView *)scrollView viewAtIndex:(NSUInteger)index{
    switch (index) {
        case 0:{
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kon"]];
            return imageView;
        }
            break;
            
        case 1:{
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"miku"]];
            return imageView;
        }
            break;
        case 2:{
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor blueColor];
            return view;
        }
            break;
        default:
            break;
    }
    return nil;
}

- (void)scrollView:(UIScrollView *)scrollView didSelectedAtIndex:(NSUInteger)index{
    NSLog(@"%ld",index);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.circleView relayoutSubViewsWithOffset:scrollView.contentOffset];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
