//
//  CCLocalizedLabelTTFExporter.h
//  CCBAndEngineXml
//
//  Created by Nicolas Gramlich on 5/02/12.
//  Copyright (c) 2012 Zynga. All rights reserved.
//

#import "CCLabelTTFExporter.h"

#define CCB_CCLOCALIZEDLABELTTF_CLASS_NAME @"CCLocalizedLabelTTF"

@interface CCLocalizedLabelTTFExporter : CCLabelTTFExporter

- (void) exportCCLocalizedLabelTTFProperties:(NSDictionary *)pNode withProperties:(NSArray *)pProperties withXMLWriter:(XMLWriter *)pXMLWriter withCCBXAndEngineXml:(CCBXAndEngineXml *)pCCBXAndEngineXml;

@end
