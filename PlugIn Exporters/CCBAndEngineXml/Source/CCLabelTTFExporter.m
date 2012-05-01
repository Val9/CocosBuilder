//
//  CCLabelTTFExporter.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/01/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCLabelTTFExporter.h"

@implementation CCLabelTTFExporter

- (id) init
{
    return [super initWithNodeName:CCB_CCLABELTTF_CLASS_NAME];
}

- (void) exportNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [super exportNodeProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];

    [self exportCCLabelTTFProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCLabelTTFProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml 
{
//  [self exportCCNodeBlendFunction:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCNodeColor:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCLabelTTFFontName:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCLabelTTFFontSize:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCLabelTTFString:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCLabelTTFDimensions:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCLabelTTFHorizontalAlignment:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCLabelTTFVerticalAlignment:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCLabelTTFFontName:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    NSString * fontName = [self findProperty:CCB_CCLABELTTF_PROPERTY_FONT_NAME withProperties:pProperties];
    
    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLABELTTF_ATTRIBUTE_FONT_NAME value:fontName];
}

- (void) exportCCLabelTTFFontSize:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    float fontSize = [[self findProperty:CCB_CCLABELTTF_PROPERTY_FONT_SIZE withProperties:pProperties] floatValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLABELTTF_ATTRIBUTE_FONT_SIZE value:[[NSNumber numberWithFloat:fontSize] stringValue]];
}

- (void) exportCCLabelTTFString:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    NSString * string = [self findProperty:CCB_CCLABELTTF_PROPERTY_STRING withProperties:pProperties];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLABELTTF_ATTRIBUTE_TEXT value:string];
}

- (void) exportCCNodeContentSize:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    /* Nothing. */
}

- (void) exportCCLabelTTFDimensions:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    float dimensionWidth = [[self findProperty:CCB_CCLABELTTF_PROPERTY_DIMENSIONS withProperties:pProperties withIndex:0] floatValue];
    float dimensionHeight = [[self findProperty:CCB_CCLABELTTF_PROPERTY_DIMENSIONS withProperties:pProperties withIndex:1] floatValue];
    int dimensionSizeTypeValue = [[self findProperty:CCB_CCLABELTTF_PROPERTY_DIMENSIONS withProperties:pProperties withIndex:2] intValue];
    NSString * dimensionSizeType = [self convertSizeTypeValueToSizeType:dimensionSizeTypeValue];

   [pXMLWriter writeAttribute:CCBAEX_TAG_CCLABELTTF_ATTRIBUTE_DIMENSION_WIDTH value:[[NSNumber numberWithFloat:dimensionWidth] stringValue]];
   [pXMLWriter writeAttribute:CCBAEX_TAG_CCLABELTTF_ATTRIBUTE_DIMENSION_HEIGHT value:[[NSNumber numberWithFloat:dimensionHeight] stringValue]];
   [pXMLWriter writeAttribute:CCBAEX_TAG_CCLABELTTF_ATTRIBUTE_DIMENSION_TYPE value:dimensionSizeType];
}

- (void) exportCCLabelTTFHorizontalAlignment:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    int horizontalAlignment = [[self findProperty:CCB_CCLABELTTF_PROPERTY_HORIZONTAL_ALIGNMENT withProperties:pProperties] intValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLABEL_ATTRIBUTE_ALIGN_HORIZONTAL value:[[NSNumber numberWithInt:horizontalAlignment] stringValue]];
}

- (void) exportCCLabelTTFVerticalAlignment:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    int verticalAlignment = [[self findProperty:CCB_CCLABELTTF_PROPERTY_VERTICAL_ALIGNMENT withProperties:pProperties] intValue];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLABEL_ATTRIBUTE_ALIGN_VERTICAL value:[[NSNumber numberWithInt:verticalAlignment] stringValue]];
}

@end
