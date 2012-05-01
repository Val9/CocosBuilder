//
//  CCLabelBMFontExporter.m
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/01/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCLabelBMFontExporter.h"

@implementation CCLabelBMFontExporter

- (id) init
{
    return [super initWithNodeName:CCB_CCLABELBMFONT_CLASS_NAME];
}

- (void) exportNodeProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    [super exportNodeProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];

    [self exportCCLabelBMFontProperties:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCLabelBMFontProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml 
{
    [self exportCCNodeColor:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCLabelBMFontFontName:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
    [self exportCCLabelBMFontString:pNode withProperties:pProperties withXMLWriter:pXMLWriter withCCBXAndEngineXml:pCCBXAndEngineXml];
}

- (void) exportCCLabelBMFontFontName:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    NSString * fntFile = [self findProperty:CCB_CCLABELBMFONT_PROPERTY_FNTFILE withProperties:pProperties];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLABELBMFONT_ATTRIBUTE_FONT_NAME value:fntFile];
}

- (void) exportCCLabelBMFontString:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml
{
    NSString * string = [self findProperty:CCB_CCLABELBMFONT_PROPERTY_STRING withProperties:pProperties];

    [pXMLWriter writeAttribute:CCBAEX_TAG_CCLABELBMFONT_ATTRIBUTE_TEXT value:string];
}

@end
