# Keitaro Postback Template for Google Tag Manager

## Overview
This Google Tag Manager (GTM) template allows you to send postback requests to Keitaro (a self-hosted advertising tracker) without loading external scripts. It supports multiple tracking parameters for accurate conversion tracking.

## Features
- Sends postback requests directly to Keitaro
- Supports multiple `sub_id` parameters
- Includes additional tracking fields like `cost`, `payout`, `currency`, and `keyword`
- No external script dependencies

## Installation

### 1. Download the Template
Download the `KeitaroPosback.tpl` file from this repository.

### 2. Import into Google Tag Manager
1. Open **Google Tag Manager**.
2. Navigate to **Templates** > **New**.
3. Click **Import** and upload the `KeitaroPosback.tpl` file.
4. Save the template.

### 3. Configure the Tag
1. Create a new **Tag** in GTM.
2. Select **Keitaro Postback** as the Tag Type.
3. Fill in the required fields:
   - **Domain** (Required): The domain where postback requests will be sent.
   - **Sub IDs** (Optional): Up to 5 sub IDs for tracking.
   - **Additional Parameters** (Optional): Status, payout, currency, external ID, etc.
4. Set up a **Trigger** (e.g., conversion events).
5. Save and publish the container.

## Parameters

| Parameter        | Description |
|-----------------|-------------|
| `domain`        | **(Required)** Keitaro domain to send postback requests |
| `sub_id_1` - `sub_id_5` | Optional tracking parameters |
| `status`        | Event or conversion status |
| `payout`        | Payout value for the event |
| `currency`      | Currency of the transaction |
| `external_id`   | External tracking ID |
| `creative_id`   | ID of the creative used |
| `ad_campaign_id`| ID of the ad campaign |
| `source`        | Traffic source |
| `keyword`       | Keyword associated with the event |
| `cost`          | Cost of the conversion |
| `ts`            | Timestamp of the event |

## Example Request
```
https://your-keitaro-domain.com/pxtrk?sub_id_1=123&status=lead&payout=10&currency=USD&source=google_ads&ts=123456789
```

## Keitaro Documentation
For more details on Keitaro postbacks, refer to the [Keitaro Documentation](https://docs.keitaro.io/en/conversions-and-postback/postback.html).

## License
This project is licensed under the [MIT License](LICENSE).

