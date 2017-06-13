//
//  TTRangeSliderView.h
//
//  Created by Tom Thorpe
//

#import <UIKit/UIKit.h>
#import "TTRangeSliderDelegate.h"
//#import "UIColor+MNExtension.h"
IB_DESIGNABLE
@interface TTRangeSlider : UIControl <UIGestureRecognizerDelegate>

@property (nonatomic, weak) id<TTRangeSliderDelegate> delegate;

/**
 * 在范围内选择的最小可能值
 */
@property (nonatomic, assign) IBInspectable float minValue;

/**
 * 在该范围内选择的最大可能值
 */
@property (nonatomic, assign) IBInspectable float maxValue;

/**
 * 预定的最小值
 * (note: 这应该是小于selectedmaximum)
 */
@property (nonatomic, assign) IBInspectable float selectedMinimum;

/**
 * 预选的最大值
 * (note: 这应该是大于selectedminimum)
 */
@property (nonatomic, assign) IBInspectable float selectedMaximum;

/**
 * 滑块中的每个句柄都有一个标签，上面显示当前选择的值。默认情况下，这将显示为十进制格式。
 * 您可以重写此默认这里提供你自己的NSNumberFormatter。例如，你可以提供一个nsnumberformatter具有货币样式，或前缀或后缀.
 * 如果此属性为零，则将使用默认的十进制格式。注：如果您不想标签，请使用hidelabels旗. */
@property (nonatomic, strong) NSNumberFormatter *numberFormatterOverride;

/**
 * 隐藏滑块控件上方的标签。是标签将被隐藏。否=标签将显示。默认为无.
 */
@property (nonatomic, assign) IBInspectable BOOL hideLabels;

/**
 * 最小值文本标签的颜色。如果不设置，默认是tintColor.
 */
@property (nonatomic, strong) IBInspectable UIColor *minLabelColour;

/**
 * 最大值文本标签的颜色。如果不设置，默认是tintColor.
 */
@property (nonatomic, strong) IBInspectable UIColor *maxLabelColour;


/**
 * 最小值文本标签的字体。如果没有设置，默认是系统字体大小12.
 */
@property (nonatomic, strong) IBInspectable UIFont *minLabelFont;

/**
 * 最大值文本标签的字体。如果没有设置，默认是系统字体大小12.
 */
@property (nonatomic, strong) IBInspectable UIFont *maxLabelFont;

/**
 * 为最低值处理程序显示在可访问模式中的标签 */
@property (nonatomic, strong) IBInspectable NSString *minLabelAccessibilityLabel;

/**
 * 在可访问模式中显示为最大值处理程序的标签
 */
@property (nonatomic, strong) IBInspectable NSString *maxLabelAccessibilityLabel;

/**
 * 为最低值处理程序显示在可访问模式中的简要说明
 */
@property (nonatomic, strong) IBInspectable NSString *minLabelAccessibilityHint;

/**
 * 在可访问模式中显示的最大值处理程序的简要说明
 */
@property (nonatomic, strong) IBInspectable NSString *maxLabelAccessibilityHint;

/**
 * 如果TRUE，控件将模拟正常滑块和只有一个句柄，而不是范围.
 * 在这种情况下，该selectedminvalue将没有功能了。使用selectedmaxvalue相反的价值判断用户选择.
 */
@property (nonatomic, assign) IBInspectable BOOL disableRange;

@property (nonatomic, assign) IBInspectable float minDistance;

@property (nonatomic, assign) IBInspectable float maxDistance;

/**
 * 如果真的要控制在最小和最大对齐点之间的每一步
 */
@property (nonatomic, assign) IBInspectable BOOL enableStep;

/**
 * 步值，控制每一步的值。如果没有设置默认为0.1
 * (note: this is ignored if <= 0.0)
 */
@property (nonatomic, assign) IBInspectable float step;

/**
 *在标签和句柄之间设置填充（默认8）
 */
@property (nonatomic, assign) IBInspectable CGFloat labelPadding;

/**
 *用自定义图像处理滑块，可以为句柄设置自定义图像
 */
@property (nonatomic, strong) UIImage *handleImage;

/**
 *用自定义颜色处理滑块，可以为句柄设置自定义颜色
 */
@property (nonatomic, strong) UIColor *handleColor;

/**
 *处理滑块与自定义边框颜色，您可以设置自定义边框颜色为您的句柄
 */
@property (nonatomic, strong) UIColor *handleBorderColor;

/**
 *处理边框宽度（默认0）
 */
@property (nonatomic, assign) CGFloat handleBorderWidth;

/**
 *手柄直径（默认16）
 */
@property (nonatomic, assign) CGFloat handleDiameter;

/**
 *选择手柄直径乘数（默认1.7）
 */
@property (nonatomic, assign) CGFloat selectedHandleDiameterMultiplier;

/**
 *设置滑块线颜色之间的处理
 */
@property (nonatomic, strong) UIColor *tintColorBetweenHandles;

/**
 *设置滑块线高度（默认1）
 */
@property (nonatomic, assign) CGFloat lineHeight;

@end
