//
//  CCLayerGradientExporter.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/01/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCLayerExporter.h"

#define CCB_CCLAYERGRADIENT_CLASS_NAME @"CCLayerGradient"

#define CCB_CCLAYERGRADIENT_PROPERTY_START_COLOR @"startColor"
#define CCB_CCLAYERGRADIENT_PROPERTY_START_OPACITY @"startOpacity"
#define CCB_CCLAYERGRADIENT_PROPERTY_END_COLOR @"endColor"
#define CCB_CCLAYERGRADIENT_PROPERTY_END_OPACITY @"endOpacity"
#define CCB_CCLAYERGRADIENT_PROPERTY_VECTOR @"vector"

#define CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_FROM_RED @"fromRed"
#define CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_FROM_GREEN @"fromGreen"
#define CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_FROM_BLUE @"fromBlue"
#define CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_FROM_ALPHA @"fromAlpha"

#define CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_TO_RED @"toRed"
#define CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_TO_GREEN @"toGreen"
#define CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_TO_BLUE @"toBlue"
#define CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_TO_ALPHA @"toAlpha"

#define CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_VECTOR_X @"vectorX"
#define CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_VECTOR_Y @"vectorY"

@interface CCLayerGradientExporter : CCLayerExporter

- (void) exportCCLayerGradientProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

- (void) exportCCLayerGradientGradient:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

@end
