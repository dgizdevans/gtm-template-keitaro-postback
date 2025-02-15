___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Keitaro Posback",
  "brand": {
    "id": "brand_dummy",
    "displayName": "Custom Template"
  },
  "description": "Keitaro Postback Template for Google Tag Manager sends conversion or event data to Keitaro via postback, without loading external scripts, ensuring accurate tracking with multiple parameters.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "domain",
    "displayName": "Domain (This field is required)",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "sub_id_1",
    "displayName": "Sub ID 1",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "sub_id_2",
    "displayName": "Sub ID 2",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "sub_id_3",
    "displayName": "Sub ID 3",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "sub_id_4",
    "displayName": "Sub ID 4",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "sub_id_5",
    "displayName": "Sub ID 5",
    "simpleValueType": true
  },
  {
    "type": "SELECT",
    "name": "status",
    "displayName": "Status (predefined value)",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "lead",
        "displayValue": "lead"
      },
      {
        "value": "sale",
        "displayValue": "sale"
      },
      {
        "value": "rejected",
        "displayValue": "rejected"
      },
      {
        "value": "rebill",
        "displayValue": "rebill"
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "payout",
    "displayName": "Payout",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "currency",
    "displayName": "Currency",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "external_id",
    "displayName": "External ID",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "creative_id",
    "displayName": "Creative ID",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "ad_campaign_id",
    "displayName": "Ad Campaign ID",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "source",
    "displayName": "Source",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "keyword",
    "displayName": "Keyword",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "cost",
    "displayName": "Cost",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Require GTM APIs
const encodeUri = require("encodeUri");
const logToConsole = require("logToConsole");
const sendPixel = require("sendPixel");
const getContainerVersion = require("getContainerVersion");
const getTimestamp = require("getTimestamp");

// Extract data directly from the template parameters
const domain = data.domain || null;
const subId1 = data.sub_id_1 || "";
const subId2 = data.sub_id_2 || "";
const subId3 = data.sub_id_3 || "";
const subId4 = data.sub_id_4 || "";
const subId5 = data.sub_id_5 || "";
const status = data.status || "";
const payout = data.payout || "";
const currency = data.currency || "";
const externalId = data.external_id || "";
const creativeId = data.creative_id || "";
const adCampaignId = data.ad_campaign_id || "";
const source = data.source || "";
const keyword = data.keyword || "";
const cost = data.cost || "";

// Validate domain presence
if (!domain) {
    logToConsole("ERROR: Domain is missing in GTM tag configuration!");
    if (typeof data.gtmOnFailure === "function") {
        data.gtmOnFailure();
    }
}

// Function to safely encode URL parameters
function safeEncode(str) {
    return str ? encodeUri(str.trim()) : "";
}

// Construct postback URL
const postbackUrl = "https://" + domain + "/pxtrk?sub_id_1=" + safeEncode(subId1) +
    "&sub_id_2=" + safeEncode(subId2) +
    "&sub_id_3=" + safeEncode(subId3) +
    "&sub_id_4=" + safeEncode(subId4) +
    "&sub_id_5=" + safeEncode(subId5) +
    "&status=" + safeEncode(status) +
    "&payout=" + safeEncode(payout) +
    "&currency=" + safeEncode(currency) +
    "&external_id=" + safeEncode(externalId) +
    "&creative_id=" + safeEncode(creativeId) +
    "&ad_campaign_id=" + safeEncode(adCampaignId) +
    "&source=" + safeEncode(source) +
    "&keyword=" + safeEncode(keyword) +
    "&cost=" + safeEncode(cost) +
    "&ts=" + getTimestamp();

// Handle success
function onPostbackSuccess() {
    if (typeof data.gtmOnSuccess === "function") {
        data.gtmOnSuccess();
    }
}

// Handle failure
function onPostbackFailure() {
    if (typeof data.gtmOnFailure === "function") {
        data.gtmOnFailure();
    }
}

// Send pixel request
sendPixel(postbackUrl);

// Confirm execution
onPostbackSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "send_pixel",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_container_data",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Test All Fields
  code: |-
    const mockData = {
      domain: "example.com",
      sub_id_1: "test1",
      sub_id_2: "test2",
      sub_id_3: "test3",
      sub_id_4: "test4",
      sub_id_5: "test5",
      status: "approved",
      payout: "10.5",
      currency: "USD",
      external_id: "123456",
      creative_id: "78910",
      ad_campaign_id: "111213",
      source: "google_ads",
      keyword: "best offer",
      cost: "5.0"
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();
- name: Test Required Fields
  code: |-
    const mockData = {
      domain: "example.com"
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 2/12/2025, 5:24:57 PM


