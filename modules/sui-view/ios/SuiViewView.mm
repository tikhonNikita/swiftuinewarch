#import "SuiViewView.h"

#import <react/renderer/components/RNSuiViewViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNSuiViewViewSpec/EventEmitters.h>
#import <react/renderer/components/RNSuiViewViewSpec/Props.h>
#import <react/renderer/components/RNSuiViewViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
#import "react-native-sui-view-Bridging-Header.h"
#import "react_native_sui_view-Swift.h"
#import "RandomTextView.h"
#import <React/RCTBridge+Private.h>

using namespace facebook::react;

@interface SuiViewView () <RCTSuiViewViewViewProtocol>

@end

@implementation SuiViewView {
    UIView * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<SuiViewViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const SuiViewViewProps>();
    _props = defaultProps;
      
    _view = [[RandomTextView alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<SuiViewViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<SuiViewViewProps const>(props);
    
    NSString *randomStr = [RandomStringGenerator randomStringWithLength:10];
    NSLog(@"Generated random string: %@", randomStr);

    if (oldViewProps.color != newViewProps.color) {
        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
        [_view setBackgroundColor:[self hexStringToColor:colorToConvert]];
    }

    if (_eventEmitter != nullptr) {
        // Cast the _eventEmitter to a shared_ptr of const SuiViewViewEventEmitter
        static const auto emitter = std::dynamic_pointer_cast<const facebook::react::SuiViewViewEventEmitter>(_eventEmitter);

        // Check if the casting is successful
        if (emitter) {
            // Call the onColorChange method with the necessary parameter
            emitter->onColorChange(facebook::react::SuiViewViewEventEmitter::OnColorChange{"#FFFFFF"}); // Pass appropriate color value
        }
    }
    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> SuiViewViewCls(void)
{
    return SuiViewView.class;
}

- hexStringToColor:(NSString *)stringToConvert
{
    NSString *noHashString = [stringToConvert stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *stringScanner = [NSScanner scannerWithString:noHashString];
    
    unsigned hex;
    if (![stringScanner scanHexInt:&hex]) return nil;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
}

@end
