//
//  CCLabelTTFExporter.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/01/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCNodeExporter.h"

#define CCB_CCLABELTTF_CLASS_NAME @"CCLabelTTF"

#define CCB_CCLABELTTF_PROPERTY_FONT_NAME @"fontName"
#define CCB_CCLABELTTF_PROPERTY_FONT_SIZE @"fontSize"
#define CCB_CCLABELTTF_PROPERTY_STRING @"string"
#define CCB_CCLABELTTF_PROPERTY_DIMENSIONS @"dimensions"
#define CCB_CCLABELTTF_PROPERTY_HORIZONTAL_ALIGNMENT @"horizontalAlignment"
#define CCB_CCLABELTTF_PROPERTY_VERTICAL_ALIGNMENT @"verticalAlignment"

#define CCBAEX_TAG_CCLABELTTF_ATTRIBUTE_FONT_NAME @"fontName"
#define CCBAEX_TAG_CCLABELTTF_ATTRIBUTE_FONT_SIZE @"fontSize"
#define CCBAEX_TAG_CCLABELTTF_ATTRIBUTE_TEXT @"text"
#define CCBAEX_TAG_CCLABELTTF_ATTRIBUTE_DIMENSION_WIDTH @"dimensionWidth"
#define CCBAEX_TAG_CCLABELTTF_ATTRIBUTE_DIMENSION_HEIGHT @"dimensionHeight"
#define CCBAEX_TAG_CCLABELTTF_ATTRIBUTE_DIMENSION_TYPE @"dimensionType"
#define CCBAEX_TAG_CCLABEL_ATTRIBUTE_ALIGN_HORIZONTAL @"horizontalAlign"
#define CCBAEX_TAG_CCLABEL_ATTRIBUTE_ALIGN_VERTICAL @"verticalAlign"

@interface CCLabelTTFExporter : CCNodeExporter

- (id) initWithNodeName:(NSString*)pNodeName;

- (void) exportCCLabelTTFProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

- (void) exportCCLabelTTFFontName:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCLabelTTFFontSize:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCLabelTTFString:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCLabelTTFDimensions:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCLabelTTFHorizontalAlignment:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;
- (void) exportCCLabelTTFVerticalAlignment:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

@end
