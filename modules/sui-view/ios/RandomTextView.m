
#import "RandomTextView.h"
#import "react_native_sui_view-Swift.h"

@implementation RandomTextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    UIViewController *hostingController = [RandomTextViewFactory createViewController];
    
    // Add the hosting controller's view to the current view
    UIView *swiftUIView = hostingController.view;
    swiftUIView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:swiftUIView];
    
    // Add constraints to make swiftUIView fill the entire RandomTextView
    [NSLayoutConstraint activateConstraints:@[
        [swiftUIView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [swiftUIView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [swiftUIView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [swiftUIView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
    
    // Add the hosting controller as a child view controller (if this is within a view controller)
    UIViewController *parentViewController = [self parentViewController];
    if (parentViewController) {
        [parentViewController addChildViewController:hostingController];
        [hostingController didMoveToParentViewController:parentViewController];
    }
}

// Helper method to find the parent view controller
- (UIViewController *)parentViewController {
    UIResponder *responder = self;
    while ([responder isKindOfClass:[UIView class]]) {
        responder = [responder nextResponder];
    }
    return (UIViewController *)responder;
}

@end

