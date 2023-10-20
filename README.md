# HubspotStub

This gem provides a stub server to connecte with Hubspot and use Hubspot APIs.  Currently, the following APIs are connected:
* [OAuth Authentication](https://developers.hubspot.com/docs/api/working-with-oauth)
* [Forms API](https://legacydocs.hubspot.com/docs/methods/forms/forms_overview)
* [Marketing API](https://developers.hubspot.com/docs/api/marketing/forms)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hubspot_stub'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hubspot_stub

## Usage

Rspec callbacks should be added in such way:

```
RSpec.configure do |config|
  config.before(:suite) do
    HubspotStub.boot
  end

  config.around(:each) do |example|
    HubspotStub.clear_store

    ClimateControl.modify(
      BASE_URL = "https://api.hubapi.com/"
      BASE_SUBMISSIONS_URL = "https://api.hsforms.com"
    ) do
      example.run
    end

    HubspotStub.clear_store
  end
```


### Hubspot Forms

To use the Hubspot Forms API, you'll need to create two environment variables that can be stubbed out in your specs.
* `HUBSPOT_API_URL`
* `HUBSPOT_API_SUBMISSIONS_URL`

After overriding the your API endpoint environment variables, you will have a stubbed out that Hubspot server that can store configuration in memory.

For example, to create a form with fields you can use the following code:
```
HubspotStub.create_form(
    {
      "formType": "hubspot",
      "id": "381e0ca4-0549-445c-82e6-e30f78e5e7d0",
      "name": "Company Signup",
      "createdAt": "2023-09-08 19:56:19 UTC",
      "updatedAt": "2023-09-08 19:56:19 UTC",
      "archived": false,
      "fieldGroups": [
        {
          "groupType": "default_group",
          "richTextType": "text",
          "fields": [
            {
              "fieldType": "single_line_text",
              "objectTypeId": "0-1",
              "name": "firstname",
              "label": "Your first name",
              "required": false,
              "hidden": false
            },
            {
              "fieldType": "single_line_text",
              "objectTypeId": "0-1",
              "name": "lastname",
              "label": "Your last name",
              "required": false,
              "hidden": false
            }
          ]
        },
        {
          "groupType": "default_group",
          "richTextType": "text",
          "fields": [
            {
              "fieldType": "email",
              "objectTypeId": "0-1",
              "name": "email",
              "label": "Your email",
              "required": true,
              "hidden": false,
              "validation": {
                "blockedEmailDomains": [

                ],
                "useDefaultBlockList": false
              }
            }
          ]
        },
        {
          "groupType": "default_group",
          "richTextType": "text",
          "fields": [
            {
              "fieldType": "single_line_text",
              "objectTypeId": "0-2",
              "name": "name",
              "label": "Your company name",
              "required": false,
              "hidden": false
            }
          ]
        },
        {
          "groupType": "default_group",
          "richTextType": "text",
          "fields": [
            {
              "fieldType": "single_line_text",
              "objectTypeId": "0-2",
              "name": "city",
              "label": "Company city",
              "required": false,
              "hidden": false
            }
          ]
        },
        {
          "groupType": "default_group",
          "richTextType": "text",
          "fields": [
            {
              "fieldType": "single_line_text",
              "objectTypeId": "0-1",
              "name": "jobtitle",
              "label": "Your role",
              "required": false,
              "hidden": false
            }
          ]
        }
      ],
      "configuration": {
        "language": "en",
        "cloneable": true,
        "postSubmitAction": {
          "type": "thank_you",
          "value": "Thanks for submitting the form."
        },
        "editable": true,
        "archivable": true,
        "recaptchaEnabled": false,
        "notifyContactOwner": false,
        "notifyRecipients": [
          "27968940"
        ],
        "createNewContactForNewEmail": false,
        "prePopulateKnownValues": true,
        "allowLinkToResetKnownValues": false
      },
      "displayOptions": {
        "renderRawHtml": false,
        "theme": "default_style",
        "submitButtonText": "Submit",
        "style": {
          "fontFamily": "arial, helvetica, sans-serif",
          "backgroundWidth": "100%",
          "labelTextColor": "#212D3A",
          "labelTextSize": "13px",
          "helpTextColor": "#7C98B6",
          "helpTextSize": "11px",
          "legalConsentTextColor": "#33475B",
          "legalConsentTextSize": "14px",
          "submitColor": "#FF7A59",
          "submitAlignment": "left",
          "submitFontColor": "#FFFFFF",
          "submitSize": "12px"
        },
        "cssClass": "hs-form stacked"
      },
      "legalConsentOptions": {
        "type": "none"
      }
    }
)
``` 

To access or edit the created forms on the server, use the `forms` method:
```
HubspotStub.forms
```

There are several pre-configured forms that can be customized based on your needs:
```
HubspotStub::ArchivedForm.merge(name: "Old Archived Form")
HubspotStub::SsmpleForm.merge(name: "Sign Up Form")
```

Be sure to clear all of the created forms between test runs:
```
HubspotStub.clear_store
```
