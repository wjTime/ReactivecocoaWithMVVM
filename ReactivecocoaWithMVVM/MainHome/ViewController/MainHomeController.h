//
//  MainHomeController.h
//  ReactivecocoaWithMVVM
//
//  Created by Kenvin on 16/10/20.
//  Copyright © 2017年 上海方创金融信息服务股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainHomeViewModel.h"
@interface MainHomeController : BaseViewController

- (instancetype)initWithViewModel:(MainHomeViewModel *)viewModel;

@end
