Profile: BeDevice
Parent: Device
Id: be-device
Title: "BeDevice"
Description: "A medical device used in the context of Belgian healthcare."

* identifier 0..1 MS
* udiCarrier 0..1 MS
* udiCarrier.deviceIdentifier MS
* udiCarrier.carrierHRF MS
* status 0..1 MS
* statusReason 0..* MS
* type 0..1 MS
* type from DeviceTypeVS (extensible)
* deviceName 0..1 MS
* modelNumber 0..1 MS
* manufacturer 0..1 MS
* manufactureDate 0..1 MS
* expirationDate 0..1 MS
* lotNumber 0..1 MS
* serialNumber 0..1 MS
* version 0..* MS
* property 0..* MS
* patient 0..1 MS
* patient only Reference(BePatient)
* owner 0..1 MS
* owner only Reference(BeOrganization)
* definition MS
* note 0..* MS
