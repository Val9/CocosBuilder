//
//  CCLayerGradient.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/01/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCLayerGradientExporter.h"

@implementation CCLayerGradientExporter

- (id) init
{
    return [super initWithNodeName:CCB_CCLAYERGRADIENT_CLASS_NAME];
}

- (void) exportNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [super exportNodeProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];

    [self exportCCLayerGradientProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCLayerGradientProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml 
{
    [self exportCCNodeBlendFunction:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCLayerGradientGradient:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCNodeColor:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    /* Nothing. */
}

- (void) exportCCLayerGradientGradient:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    /* Start. */
    int startRed = [[self findProperty:CCB_CCLAYERGRADIENT_PROPERTY_START_COLOR withProperties:pProperties withIndex:0] intValue];
    int startGreen = [[self findProperty:CCB_CCLAYERGRADIENT_PROPERTY_START_COLOR withProperties:pProperties withIndex:1] intValue];
    int startBlue = [[self findProperty:CCB_CCLAYERGRADIENT_PROPERTY_START_COLOR withProperties:pProperties withIndex:2] intValue];
    int startOpacity = [[self findProperty:CCB_CCLAYERGRADIENT_PROPERTY_START_OPACITY withProperties:pProperties] intValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_FROM_RED value:[[NSNumber numberWithInt:startRed] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_FROM_GREEN value:[[NSNumber numberWithInt:startGreen] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_FROM_BLUE value:[[NSNumber numberWithInt:startBlue] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_FROM_ALPHA value:[[NSNumber numberWithInt:startOpacity] stringValue]];

    /* End. */
    int endRed = [[self findProperty:CCB_CCLAYERGRADIENT_PROPERTY_END_COLOR withProperties:pProperties withIndex:0] intValue];
    int endGreen = [[self findProperty:CCB_CCLAYERGRADIENT_PROPERTY_END_COLOR withProperties:pProperties withIndex:1] intValue];
    int endBlue = [[self findProperty:CCB_CCLAYERGRADIENT_PROPERTY_END_COLOR withProperties:pProperties withIndex:2] intValue];
    int endOpacity = [[self findProperty:CCB_CCLAYERGRADIENT_PROPERTY_END_OPACITY withProperties:pProperties] intValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_TO_RED value:[[NSNumber numberWithInt:endRed] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_TO_GREEN value:[[NSNumber numberWithInt:endGreen] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_TO_BLUE value:[[NSNumber numberWithInt:endBlue] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_COLOR_TO_ALPHA value:[[NSNumber numberWithInt:endOpacity] stringValue]];

    /* Vector. */
    int vectorX = [[self findProperty:CCB_CCLAYERGRADIENT_PROPERTY_VECTOR withProperties:pProperties withIndex:0] floatValue];
    int vectorY = [[self findProperty:CCB_CCLAYERGRADIENT_PROPERTY_VECTOR withProperties:pProperties withIndex:1] floatValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_VECTOR_X value:[[NSNumber numberWithFloat:vectorX] stringValue]];
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLAYERGRADIENT_ATTRIBUTE_GRADIENT_VECTOR_Y value:[[NSNumber numberWithFloat:vectorY] stringValue]];
}
@end
