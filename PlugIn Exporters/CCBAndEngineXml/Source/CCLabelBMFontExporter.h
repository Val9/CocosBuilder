//
//  CCLabelBMFontExporter.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/01/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCNodeExporter.h"

#define CCB_CCLABELBMFONT_CLASS_NAME @"CCLabelBMFont"

#define CCB_CCLABELBMFONT_PROPERTY_FNTFILE @"fntFile"
#define CCB_CCLABELBMFONT_PROPERTY_STRING @"string"

#define CCBAEX_TAG_CCLABELBMFONT_ATTRIBUTE_FONT_NAME @"fontName"
#define CCBAEX_TAG_CCLABELBMFONT_ATTRIBUTE_TEXT @"text"

@interface CCLabelBMFontExporter : CCNodeExporter

- (void) exportCCLabelBMFontProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

- (void) exportCCLabelBMFontFontName:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCLabelBMFontString:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

@end
