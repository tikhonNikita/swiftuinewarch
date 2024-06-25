#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"

@interface SuiViewViewManager : RCTViewManager
@end

@implementation SuiViewViewManager

RCT_EXPORT_MODULE(SuiViewView)

- (UIView *)view
{
  return [[UIView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(color, NSString)
RCT_EXPORT_VIEW_PROPERTY(onColorChange, RCTDirectEventBlock)

@end
