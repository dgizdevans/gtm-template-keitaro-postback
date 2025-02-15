/**
 * Keitaro Postback Template for Google Tag Manager
 * 
 * This template sends conversion or event data to Keitaro via postback 
 * without loading external scripts. Supports multiple tracking parameters.
 * 
 * GitHub Repository: https://github.com/dgizdevans/gtm-template-keitaro-postback
 *
 */

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
