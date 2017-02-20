//
//  MainHomeController.m
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 16/10/20.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import "MainHomeController.h"
#import "MainHomeViewModel.h"
#import "MainHomeCell.h"
@interface MainHomeController ()

@property (nonatomic,strong) MainHomeViewModel *mainHomeViewModel;

@property (nonatomic,strong) TableViewBindingHelper *tableViewBindingHelper;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIView *headerView;

@end

@implementation MainHomeController

#pragma mark - Life Cycle

- (instancetype)initWithViewModel:(MainHomeViewModel *)viewModel{
    if (self = [super init]) {
        _mainHomeViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self.mainHomeViewModel.mainHomeCommand execute:@1];
    
    
    self.tableViewBindingHelper = [TableViewBindingHelper bindingHelperForTableView:self.tableView sourceSignal:RACObserve(self.mainHomeViewModel, mainHomeModel.data) selectionCommand:nil templateCell:@"MainHomeCell" withViewModel:self.mainHomeViewModel];

    
}


- (UITableView *)tableView{
    return LAZYLOAD(_tableView, ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        tableView.tableHeaderView = self.headerView;
        tableView.rowHeight = 180;
        [self.view addSubview:tableView];
        tableView;
    }));
}

- (UIView *)headerView{
    return LAZYLOAD(_headerView, ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
        view;
    }));
}
@end
